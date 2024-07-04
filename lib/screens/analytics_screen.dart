import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/screens/provider_class.dart';
import 'package:untitled6/widgets/custom_container.dart';

import '../widgets/chartvalues_container.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<TransactionProvider>(context, listen: false);
    dateController.text = DateFormat('MMMM yyyy').format(provider.dateTime);
  }

  @override
  Widget build(BuildContext context) {
    var width=const SizedBox(width: 5);
    var height=const SizedBox(height: 5);
    final provider = Provider.of<TransactionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Analytics",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IntrinsicWidth(
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: InkWell(
                  onTap: () {
                    pickedDate(context, provider);
                  },
                  child: const Icon(Icons.arrow_drop_down_circle_outlined),
                ),
                hintText: DateFormat('MMMM yyyy').format(provider.dateTime),
                hintStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30),
                ),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFFedf0f8), width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: const Color(0xFFedf0f8),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
              ),
              controller: dateController,
            ),
          ),
          width,
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          width,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(
                    border: const Border(
                      top: BorderSide.none,
                      right: BorderSide.none,
                      bottom: BorderSide(width: 1),
                      left: BorderSide(width: 1),
                    ),
                  ),
                  groupsSpace: 10,
                  barGroups: [
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(
                          fromY: 0,
                          toY: provider.totalCredit / 1000,
                          width: 15,
                          color: Colors.green),
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(
                          fromY: 0,
                          toY: provider.totalDebit / 1000,
                          width: 15,
                          color: Colors.pinkAccent),
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(
                          fromY: 0,
                          toY: provider.totalInvestment / 1000,
                          width: 15,
                          color: Colors.blue),
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(
                          fromY: 0,
                          toY: provider.totalSavings / 1000,
                          width: 15,
                          color: Colors.orange),
                    ]),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const style = TextStyle(
                            color: Colors.black,
                          );
                          Widget text;
                          switch (value.toInt()) {
                            case 15:
                              text = const Text('15 K', style: style);
                              break;
                            case 30:
                              text = const Text('30 K', style: style);
                              break;
                            case 45:
                              text = const Text('45 K', style: style);
                              break;
                            case 60:
                              text = const Text('60 K', style: style);
                              break;
                            case 75:
                              text = const Text('75 K', style: style);
                              break;
                            case 90:
                              text = const Text('90 K', style: style);
                              break;
                            default:
                              text = const Text('', style: style);
                              break;
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: text,
                          );
                        },
                        reservedSize: 40,
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const style = TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          );
                          Widget text;
                          switch (value.toInt()) {
                            case 1:
                              text = const Text('Credit', style: style);
                              break;
                            case 2:
                              text = const Text('Debit', style: style);
                              break;
                            case 3:
                              text = const Text('Investment', style: style);
                              break;
                            case 4:
                              text = const Text('Savings', style: style);
                              break;
                            default:
                              text = const Text('', style: style);
                              break;
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: text,
                          );
                        },
                        reservedSize: 32,
                      ),
                    ),
                  ),
                  minY: 0,
                  maxY: 90,
                ),
                swapAnimationDuration: const Duration(milliseconds: 150),
                swapAnimationCurve: Curves.linearToEaseOut,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildLegendItem("Credit", Colors.green),
              buildLegendItem("Debit", Colors.pinkAccent),
              buildLegendItem("Investment", Colors.blue),
              buildLegendItem("Savings", Colors.orange),
            ],
          ),
          height,
           CustomContainer(title: "Maintainance & Other Charge", subtitle: "Count", value: "RS ${provider.total}", count: '${provider.totalCount}'),
          const CustomContainer(title: "Total Refunds", subtitle: "No of Returns", value: "RS 0", count: "0")
        ],
      ),
    );
  }

  pickedDate(BuildContext context, TransactionProvider provider) async {
    DateTime startDate = DateTime(2023, 6, 1);
    DateTime? date = await showMonthPicker(
      context: context,
      initialDate: provider.dateTime,
      firstDate: startDate,
      lastDate: DateTime.now(),
    );
    if (date != null) {
      provider.setDateTime(date);
      dateController.text = DateFormat('MMMM yyyy').format(provider.dateTime);
    }
  }


}
