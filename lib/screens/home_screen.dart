import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/screens/provider_class.dart';
import 'package:untitled6/screens/trasnsaction_screen.dart';
import 'package:untitled6/widgets/calendar_textfield.dart';
import 'package:untitled6/widgets/custom_container.dart';

import 'ProfileScreen.dart';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              },
              icon: const Icon(Icons.person_2_rounded, size: 32),
            ),
            Text(
              " Hi, ${provider.name}",
              style: const TextStyle(fontSize: 18),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TransactionScreen()),
                );
              },
              icon: const Icon(CupertinoIcons.waveform_path_ecg, size: 32),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
                style: TextStyle(fontSize: 18),
              ),
              mediumSpacing,
              Center(
                child: buildCustomTextField(
                  context,
                  dateController,
                  _dateTime,
                  prefixIcon: const Icon(Icons.calendar_today),
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
                colorList: [
                  Colors.red,
                  Colors.yellow,
                  Colors.teal.shade700,
                  Colors.orange,
                  Colors.black,
                  Colors.grey,
                  Colors.pinkAccent
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
                  showChartValueBackground: true,
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
    );
  }
}
