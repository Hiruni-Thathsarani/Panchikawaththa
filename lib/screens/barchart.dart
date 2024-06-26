import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as syncfusion_charts;

class BarChartWidget extends StatelessWidget {
  final List<_ChartData> data = [
    _ChartData('Sellers', 12),
    _ChartData('Ads', 15),
    _ChartData('Revenue', 30),
    _ChartData('Buyers', 6.4),
  ];

  final syncfusion_charts.TooltipBehavior _tooltip =
      syncfusion_charts.TooltipBehavior(enable: true);

  BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 220,
        width: 270, // Adjust chart height as needed
        child: syncfusion_charts.SfCartesianChart(
          primaryXAxis: const syncfusion_charts.CategoryAxis(),
          primaryYAxis: const syncfusion_charts.NumericAxis(
            minimum: 0,
            maximum: 40,
            interval: 10,
          ),
          tooltipBehavior: _tooltip,
          series: <syncfusion_charts.CartesianSeries<_ChartData, String>>[
            syncfusion_charts.ColumnSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              name: 'Total',
              color: const Color(0xFFFF5C01),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
