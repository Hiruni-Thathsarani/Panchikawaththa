import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart' as pie_chart;

class PieChartWidget extends StatelessWidget {
  // Data for the pie chart
  final Map<String, double> dataMap = {
    "Ad 1": 18.47,
    "Ad 2": 17.70,
    "Ad 3": 4.25,
    "Ad 4": 3.51,
    "Ad 5": 2.83,
  };

  // Updated colors for each segment to match a bright theme
  final List<Color> colorList = [
    const Color(0xFFF26627), // Color 1
    const Color(0xFFF9A26C), // Color 2
    const Color(0xFFEFEEEE), // Color 3
    const Color(0xFF9BD7D1), // Color 4
    const Color(0xFF325D79), // Color 5
  ];

   PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0), // Optional padding
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Most Viewed Ads',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
                height: 20.0), // Space between the title and the pie chart
            pie_chart.PieChart(
              dataMap: dataMap,
              colorList: colorList,
              chartRadius:
                  MediaQuery.of(context).size.width / 2.5, // Adjusted size
              ringStrokeWidth: 24,
              animationDuration: const Duration(seconds: 2), // Animation duration
              chartValuesOptions: const pie_chart.ChartValuesOptions(
                showChartValues: true,
                showChartValuesOutside: true,
                showChartValuesInPercentage: true,
                showChartValueBackground: false,
                decimalPlaces: 1, // One decimal place for readability
              ),
              legendOptions: const pie_chart.LegendOptions(
                showLegends: true,
                legendShape: BoxShape.rectangle,
                legendTextStyle: TextStyle(fontSize: 15),
                legendPosition:
                    pie_chart.LegendPosition.bottom, // Legend position
                showLegendsInRow: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
