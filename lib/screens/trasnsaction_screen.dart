import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:untitled6/screens/provider_class.dart';

import 'analytics_screen.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    var style = const TextStyle(
        fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16);
    var styles = const TextStyle(
        fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Transactions",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const AnalyticsScreen()),
              );
            },
            icon: const Icon(
              Icons.analytics_outlined,
              size: 32,
            ),
          ),
          IconButton(
            onPressed: () {
              _showFilterOptions(context, transactionProvider);
            },
            icon: const Icon(
              Icons.sort,
              size: 32,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        automaticallyImplyLeading: true,
      ),
      body: ListView.builder(
        itemCount: transactionProvider.filteredTransactions.length,
        itemBuilder: (context, index) {
          final datas = transactionProvider.filteredTransactions[index];
          final datass = datas['type'];
          return Container(
            margin: const EdgeInsets.all(12),
            child: ListTile(
              leading: datass == 'DEBIT'
                  ? const Icon(
                      CupertinoIcons.arrow_up_right_square_fill,
                      size: 32,
                    )
                  : const Icon(
                      CupertinoIcons.arrow_down_left_square_fill,
                      size: 32,
                    ),
              title: Column(
                children: [
                  Text('${datas['narration']}', style: style),
                ],
              ),
              subtitle: datass == 'CREDIT'
                  ? const Text("Incoming Transfers")
                  : const Text("Outgoing Transfers"),
              trailing: Column(
                children: [
                  Text(datas['amount'], style: style),
                  Text(
                    '${datas['valueDate']}-',
                    style: styles
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showFilterOptions(
      BuildContext context, TransactionProvider transactionProvider) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "FILTER BY :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.teal.shade700),
                  ),
                  RadioListTile(
                    title: const Text(
                      'DEBIT',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: 'DEBIT',
                    groupValue: transactionProvider.selectedValue,
                    onChanged: (value) {
                      setState(() {
                        transactionProvider.applyFilter(value!);
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text(
                      'CREDIT',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: 'CREDIT',
                    groupValue: transactionProvider.selectedValue,
                    onChanged: (value) {
                      setState(() {
                        transactionProvider.applyFilter(value!);
                      });
                    },
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "MODE OF TRANSACTION ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade700,
                    ),
                    //decoration: TextDecoration.underline),
                  ),
                  const SizedBox(height: 5),
                  RadioListTile(
                    title: const Text(
                      'UPI',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: 'UPI',
                    groupValue: transactionProvider.selectedValue,
                    onChanged: (value) {
                      setState(() {
                        transactionProvider.applyFilter(value!);
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text(
                      'ATM',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: 'ATM',
                    groupValue: transactionProvider.selectedValue,
                    onChanged: (value) {
                      setState(() {
                        transactionProvider.applyFilter(value!);
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text(
                      'OTHERS',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: 'OTHERS',
                    groupValue: transactionProvider.selectedValue,
                    onChanged: (value) {
                      setState(() {
                        transactionProvider.applyFilter(value!);
                      });
                    },
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(
                            context, transactionProvider.selectedValue);
                      },
                      child: const Text(
                        'Apply Filter',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((selectedOption) {
      if (selectedOption != null) {
        transactionProvider.applyFilter(selectedOption);
      }
    });
  }
}
