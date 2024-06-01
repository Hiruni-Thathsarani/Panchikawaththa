import 'package:flutter/material.dart';
import 'package:my_app/view_page.dart';
import 'package:my_app/screens/manage_accounts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Sellers', 12),
      _ChartData('Ads', 15),
      _ChartData('Revenue', 30),
      _ChartData('Buyers', 6.4),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  // Handle back button action here
                },
                icon: Icon(Icons.arrow_back),
              ),
              const Text('My profile'),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 1), // Container for profile picture icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFFEBEBEB), // Square-shaped layer color
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    // Handle profile picture upload action here
                  },
                  iconSize: 80,
                  icon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 5),
              // Upload icon above two buttons
              Text(
                'Thathsarani_Mdh', // Replace with actual user's name
                style: TextStyle(fontSize: 13), // Set text size
              ),
              Text(
                'hirunithathsarani2001@gmail.com',
                style: TextStyle(fontSize: 11),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return ViewPage();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFFFF5C01),
                      minimumSize: Size(150, 50), // Adjust button size here
                    ),
                    child: const Text('View Analytics'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return ManageAccount();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFFFF5C01),
                      minimumSize: Size(150, 50), // Adjust button size here
                    ),
                    child: const Text('Manage Accounts'),
                  ),
                ],
              ),
              SizedBox(height: 45),
              // Three square boxes with text labels
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSquareButton(' Sellers', Icons.person),
                  _buildSquareButton(' Buyers', Icons.shopping_cart),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSquareButton(' Ads', Icons.library_books),
                  _buildSquareButton('Orders', Icons.trolley),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSquareButton('Products', Icons.car_rental),
                  _buildSquareButton('Categories', Icons.category),
                ],
              ),  
              const SizedBox(height: 50),
              // Action bar with tabs
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  'Statistics',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFF5C01),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                color: Colors.grey[200],
                child: TabBar(
                    tabs: [
                      Tab(text: 'Overview'),
                      Tab(text: 'Revenues'),
                      Tab(text: 'Ads'),
                      Tab(text: 'Monthly Visits'),
                    ],
                    labelColor: Colors.black,
                    indicatorColor: Colors.orange,
                    indicatorWeight: BorderSide.strokeAlignOutside),
              ),
              SizedBox(height: 30),
              Container(
                height: 200, // Adjust height as needed
                child: TabBarView(
                  children: [
                    _buildOverviewContent(),
                    _buildRevenueContent(),
                    _buildAdsContent(),
                    _buildMonthlyVisitsContent(),
                  ],
                ),
              ),
              SizedBox(height: 10),
              // Bar Chart
            ],
          ),
        ),
        bottomNavigationBar: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.dashboard, color: Color(0xFFFF5C01)),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    var iconColor = Colors.green; // Change the color to red
                  });
                  // Handle delete action here
                },
                icon: Icon(Icons.delete, color: Color(0xFFFF5C01)),
              ),
              IconButton(
                onPressed: () {
                  // Handle add action here
                },
                icon: Icon(Icons.add, color: Color(0xFFFF5C01)),
              ),
              IconButton(
                onPressed: () {
                  // Handle action here
                },
                icon: Icon(Icons.settings, color: Color(0xFFFF5C01)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewContent() {
    // Build content for Overview tab
    return Center(
      child: Container(
        height: 200,
        width: 250, // Adjust chart height as needed
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: 40,
            interval: 10,
          ),
          tooltipBehavior: _tooltip,
          series: <CartesianSeries<_ChartData, String>>[
            ColumnSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              name: 'Total',
              color: Color.fromRGBO(95, 97, 99, 1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueContent() {
    // Build content for Revenue tab
    return Center(
      child: Text('Revenue Content Here'),
    );
  }

  Widget _buildAdsContent() {
    // Build content for Ads tab
    return Center(
      child: Text('Ads Content Here'),
    );
  }

  Widget _buildMonthlyVisitsContent() {
    // Build content for Monthly Visits tab
    return Center(
      child: Text('Monthly Visits Content Here'),
    );
  }

  Widget _buildSquareButton(String labelText, IconData icon) {
    return Container(
      width: 130, // Adjust button width here
      height: 100, // Adjust button height here
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFEBEBEB),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          SizedBox(width: 5),
          Text(labelText),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
