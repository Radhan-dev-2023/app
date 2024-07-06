
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

import 'package:untitled6/screens/provider_class.dart';
import 'package:untitled6/widgets/calendar_textfield.dart';
import 'package:untitled6/widgets/custom_container.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime _dateTime;

  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    dateController.text = DateFormat('MMMM d').format(_dateTime);
  }

  @override
  Widget build(BuildContext context) {
    var mediumSpacing = const SizedBox(height: 20);
    var spacing = const SizedBox(height: 40);
    final provider = Provider.of<TransactionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Hi, ${provider.name}",
          style: const TextStyle(fontSize: 24),
        ),
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                containerMedium(),
                mediumSpacing,
                balanceContainer(provider.totalBalance.toString(),
                    provider.totalBalances.toString()),
                mediumSpacing,
                const Text(
                  "Spend Categories Upto this month",
                  style: TextStyle(fontSize: 18,color: Color.fromRGBO(3, 3, 3, 1),fontWeight: FontWeight.w500),
                ),
                mediumSpacing,
                Center(
                  child: buildCustomTextField(
                    context,
                    dateController,
                    _dateTime,
                    prefixIcon: const Icon(Icons.date_range,color: Color.fromRGBO(57,112, 104, 1),size: 22,),
                    hintText: DateFormat('MMMM d').format(_dateTime),
                  ),
                ),
                spacing,
                PieChart(
                  centerTextStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  dataMap: provider.dataMap,
                  animationDuration: const Duration(milliseconds: 800),
                  chartLegendSpacing: 32,
                  chartRadius: MediaQuery.of(context).size.width / 2.2,
                  colorList: const [
                    Color.fromRGBO(168, 226, 156, 1),
                    Color.fromRGBO(226, 211, 156, 1),
                    Color.fromRGBO(195, 247, 236, 1),
                    Color.fromRGBO(239, 183, 234, 1),
                    Color.fromRGBO(154, 175, 225, 1),
                    Color.fromRGBO(180, 224, 241, 1),
                    Color.fromRGBO(229, 210, 239, 1),
                  ],
                  initialAngleInDegree: 0,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 50,
                  centerText: "ACTIVE \nOutgoing\nTransfers",
                  legendOptions: const LegendOptions(
                    showLegendsInRow: true,
                    legendPosition: LegendPosition.bottom,
                    showLegends: true,
                    legendShape: BoxShape.rectangle,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: false,
                    showChartValues: true,
                    showChartValuesInPercentage: false,
                    showChartValuesOutside: true,
                    decimalPlaces: 2,
                  ),
                  totalValue:
                      provider.dataMap.values.reduce((a, b) => a + b).toDouble(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> _onBackPressed() {
    return showDialog(

      context: context,
      builder: (context) => AlertDialog(
        title:  Text(
          'ANALYTICS APP',
          style: TextStyle(
              fontSize: 18, color: Color(0xFF218CB5), fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'Are you sure you want to exit the app ?',
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:  Colors.teal.shade700,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7))),
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              'No',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:  Colors.teal.shade700,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7))),
            onPressed: () {
              SystemNavigator.pop();
            },
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ).then((value) {
      if (value == true) {
        return true;
      } else {
        return false;
      }
    });
  }

}
