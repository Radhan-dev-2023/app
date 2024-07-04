import 'dart:convert';
import 'package:flutter/material.dart';
import '../Product%20Resuorces.dart';

class TransactionProvider extends ChangeNotifier {
  List<dynamic> _transactionLists = [];

  List<dynamic> _filteredTransactions = [];

  String _selectedValue = '';

  final Map<String, double> _dataMap = {
    "PETROLEUM": 0,
    "RENT": 0,
    "EMPLOYEE SALARY": 0,
    "MutualFunds": 0,
    "BHARATPE": 0,
    "POLICYBAZAAR": 0,
    "Amazon online": 0
  };
  double _totalBalance = 0.0;

  double _totalBalances = 0.0;

  String _name = '';

  List<dynamic> get transactionLists => _transactionLists;
  List<dynamic> get filteredTransactions => _filteredTransactions;
  String get selectedValue => _selectedValue;
  Map<String, double> get dataMap => _dataMap;
  double get totalBalance => _totalBalance;
  double get totalBalances => _totalBalances;
  String get name => _name;

  double totalCredit = 0.0;
  double totalDebit = 0.0;
  double totalInvestment = 0.0;
  double totalSavings = 0.0;
  double totalMaintaenance = 0.0;
  double totalRent = 0.0;
  double total = 0.0;
  int totalCount = 0;

  DateTime _dateTime = DateTime.now();
  DateTime get dateTime => _dateTime;

  TransactionProvider() {
    _loadData();
  }



  void setDateTime(DateTime newDateTime) {
    _dateTime = newDateTime;
    calculateAnalytics();
    notifyListeners();
  }

  void calculateAnalytics() {
    ProductResourcess product = ProductResourcess();
    Map<String, dynamic> jsonData = jsonDecode(product.userdatas);

    var accountData = jsonData['BARB0KIMXXX'][0]['decrypted_data']['Account'];
    var transactions = accountData['Transactions']['Transaction'];

    totalCredit = 0.0;
    totalDebit = 0.0;
    totalInvestment = 0.0;
    totalSavings = 0.0;
    totalMaintaenance = 0.0;
    totalRent = 0.0;
    total = 0.0;
    int rentCount = 0;
    int electricityCount = 0;
    transactions.forEach((transaction) {
      DateTime transactionDate =
      DateTime.parse(transaction['transactionTimestamp']);
      if (transactionDate.year == _dateTime.year &&
          transactionDate.month == _dateTime.month) {
        double amount = double.tryParse(transaction['amount']) ?? 0.0;
        if (transaction['type'] == 'CREDIT') {
          totalCredit += amount;
        } else if (transaction['type'] == 'DEBIT') {
          totalDebit += amount;
        }

        if (transaction['narration'] != null &&
            transaction['narration'].contains('MutualFunds')) {
          totalInvestment += amount;
        }
        if (transaction['narration'] != null &&
            transaction['narration'].contains('Rent')) {
          totalMaintaenance += amount;
          rentCount++;
        }
        if (transaction['narration'] != null &&
            transaction['narration'].contains('Electricity')) {
          totalRent += amount;
          electricityCount++;
        }
        total = totalRent + totalMaintaenance;

        if (transaction['mode'] != null &&
            transaction['mode'].contains('IDBI JALNA RD VIDY NGR AURAGA')) {
          totalSavings += amount;
        }
        totalCount = electricityCount + rentCount;
      }
    });

    notifyListeners();
  }

  void _loadData() {
    ProductResourcess productResourcess = ProductResourcess();
    Map<String, dynamic> jsonData = jsonDecode(productResourcess.userdatas);

    var accountData = jsonData['BARB0KIMXXX'][0]['decrypted_data']['Account'];
    var transactions = accountData['Transactions']['Transaction'];

    Map<String, double> categoryAmounts = {
      "PETROLEUM": 0,
      "RENT": 0,
      "EMPLOYEE SALARY": 0,
      "MutualFunds": 0,
      "BHARATPE": 0,
      "POLICYBAZAAR": 0,
      "Amazon online": 0
    };

    transactions.forEach((transaction) {
      var narration = transaction['narration'].toString().toUpperCase();
      var amount = double.tryParse(transaction['amount']) ?? 0.0;

      if (narration.contains('PETROLEUM')) {
        categoryAmounts['PETROLEUM'] ??= 0.0;
        categoryAmounts['PETROLEUM'] =
            (categoryAmounts['PETROLEUM'] ?? 0.0) + amount;
      } else if (narration.contains('RENT')) {
        categoryAmounts['RENT'] ??= 0.0;
        categoryAmounts['RENT'] = (categoryAmounts['RENT'] ?? 0.0) + amount;
      } else if (narration.contains('EMPLOYEE SALARY')) {
        categoryAmounts['EMPLOYEE SALARY'] ??= 0.0;
        categoryAmounts['EMPLOYEE SALARY'] =
            (categoryAmounts['EMPLOYEE SALARY'] ?? 0.0) + amount;
      } else if (narration.contains('MUTUALFUNDS')) {
        categoryAmounts['MutualFunds'] ??= 0.0;
        categoryAmounts['MutualFunds'] =
            (categoryAmounts['MutualFunds'] ?? 0.0) + amount;
      } else if (narration.contains('BHARATPE')) {
        categoryAmounts['BHARATPE'] ??= 0.0;
        categoryAmounts['BHARATPE'] =
            (categoryAmounts['BHARATPE'] ?? 0.0) + amount;
      } else if (narration.contains('POLICYBAZAAR')) {
        categoryAmounts['POLICYBAZAAR'] ??= 0.0;
        categoryAmounts['POLICYBAZAAR'] =
            (categoryAmounts['POLICYBAZAAR'] ?? 0.0) + amount;
      } else if (narration.contains('Amazon online')) {
        categoryAmounts['Amazon online'] ??= 0.0;
        categoryAmounts['Amazon online'] =
            (categoryAmounts['Amazon online'] ?? 0.0) + amount;
      }
    });

    double totalAmount =
    categoryAmounts.values.reduce((sum, amount) => sum + amount);

    _dataMap.forEach((key, value) {
      if (totalAmount != 0) {
        _dataMap[key] = (categoryAmounts[key]! / totalAmount) * 100;
      } else {
        _dataMap[key] = 0.0;
      }
    });

    var name = accountData['Profile']['Holders']['Holder']['name'];
    var currentBalance =
        double.tryParse(accountData['Summary']['currentBalance']) ?? 0.0;
    var currentODLimit =
        double.tryParse(accountData['Summary']['currentODLimit']) ?? 0.0;

    _transactionLists = transactions;
    _filteredTransactions = transactions;
    _name = name;
    _totalBalance = currentBalance;
    _totalBalances = currentODLimit;
    notifyListeners();
  }

  void applyFilter(String selectedValue) {
    _selectedValue = selectedValue;
    if (_selectedValue == 'DEBIT' || _selectedValue == 'CREDIT') {
      _filteredTransactions = _transactionLists
          .where((transaction) => transaction['type'] == _selectedValue)
          .toList();
    } else if (_selectedValue == 'UPI' ||
        _selectedValue == 'ATM' ||
        _selectedValue == 'OTHERS') {
      _filteredTransactions = _transactionLists
          .where((transaction) => transaction['mode'] == _selectedValue)
          .toList();
    } else {
      _filteredTransactions = _transactionLists;
    }
    notifyListeners();
  }
}
