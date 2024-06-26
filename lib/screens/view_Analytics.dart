import 'package:flutter/material.dart';
import 'package:my_app/admin_page.dart';

void main() {
  runApp(const ViewAnalyticApp());
}

class ViewAnalyticApp extends StatelessWidget {
  const ViewAnalyticApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ViewAnalytic(),
    );
  }
}

class ViewAnalytic extends StatefulWidget {
  const ViewAnalytic({super.key});

  @override
  _ViewAnalyticState createState() => _ViewAnalyticState();
}

class _ViewAnalyticState extends State<ViewAnalytic> {
  // Example of data that might come from a backend
  final Map<String, dynamic> data = {
    'pending': 82,
    'picked': 82,
    'delivered': 100,
    'cancel': 0,
    'todayJobs': 120,
    'todayRevenue': 'N100,000',
    'currentUsers': '30k',
    'ridersOnline': 80,
    'monthlyOrderTarget': '120,000',
    'allTimeRevenue': 'N88,000,000',
    'allTimeDelivered': '2,000,000',
    'allTimeJobs': '1,304,007',
    'allTimeCancel': '10,223',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return const AdminPage();
            }));
          },
        ),
      ),
      backgroundColor: const Color(0xFFFFFFFF), // Background color
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 1),
              const Text(
                'Daily Records',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '8:00 AM\nMon 4th, Feb',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatusCard(
                      'Active', data['pending'].toString(), Colors.blue),
                  _buildStatusCard(
                      'engaged', data['picked'].toString(), Colors.orange),
                  _buildStatusCard(
                      'Delivered', data['delivered'].toString(), Colors.green),
                  _buildStatusCard(
                      'deleted', data['cancel'].toString(), Colors.red),
                ],
              ),
              const SizedBox(height: 20),
              _buildInfoCard(
                  'Today Ads', data['todayJobs'].toString(), Icons.assignment),
              const SizedBox(height: 10),
              _buildInfoCard(
                  'Today Revenue', data['todayRevenue'], Icons.attach_money),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoCard(
                      'Current Users', data['currentUsers'], Icons.people),
                  _buildInfoCard('Riders Online',
                      data['ridersOnline'].toString(), Icons.directions_bike),
                ],
              ),
              const SizedBox(height: 20),
              _buildMonthlyTargetCard(data['monthlyOrderTarget']),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSummaryCard('All Time Revenue', data['allTimeRevenue']),
                  _buildSummaryCard(
                      'All Time Delivered', data['allTimeDelivered']),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSummaryCard('All Time Jobs', data['allTimeJobs']),
                  _buildSummaryCard('All Time Cancel', data['allTimeCancel']),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusCard(String title, String count, Color color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(
            count,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String data, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 108, 107, 109),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
              Text(
                data,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyTargetCard(String target) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFA500),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Monthly Order Target',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          Text(
            target,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Icon(Icons.tablet, color: Colors.white, size: 30),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String title, String data) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 177, 174, 180),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            Text(
              data,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
