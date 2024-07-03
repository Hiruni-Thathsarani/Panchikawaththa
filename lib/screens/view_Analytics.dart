import 'package:flutter/material.dart';
import 'package:my_app/screens/barchart.dart';
import 'package:my_app/screens/piechart.dart';
import 'package:my_app/screens/monthly_visits.dart';

class ViewAnalyticApp extends StatelessWidget {
  const ViewAnalyticApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('View Analytics'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Popular Ads'),
              Tab(text: 'Monthly Visits'),
            ],
            labelColor: Colors.black,
            indicatorColor: Color(0xFFFF5C01),
          ),
        ),
        body: TabBarView(
          children: [
            BarChartWidget(),
            PieChartWidget(),
            const MonthlyVisitsContent(),
          ],
        ),
      ),
    );
  }
}

class MonthlyVisitsContent extends StatelessWidget {
  const MonthlyVisitsContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Example counts, replace with your actual data or defaults
    int openedCount = 75;
    int engagedCount = 60;
    int eoiSentCount = 45;

    return Center(
      child: MonthlyVisitsWidget(
        openedCount: openedCount,
        engagedCount: engagedCount,
        eoiSentCount: eoiSentCount,
      ),
    );
  }
}
