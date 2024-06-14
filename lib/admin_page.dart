import 'package:flutter/material.dart';
import 'package:my_app/screens/Category.dart';
import 'package:my_app/screens/orders.dart';
import 'package:my_app/screens/product.dart';
import 'package:my_app/screens/sellers.dart';
import 'package:my_app/view_page.dart';
import 'package:my_app/screens/manage_accounts.dart';
import 'package:my_app/screens/ads.dart';
import 'package:my_app/screens/adpost1.dart';
import 'package:my_app/screens/piechart.dart';
import 'package:my_app/screens/barchart.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
                  _buildSquareButton(
                    labelText: ' Sellers',
                    icon: Icons.person,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return AppBarApp();
                      }));
                    },
                  ),
                  _buildSquareButton(
                    labelText: ' Buyers',
                    icon: Icons.shopping_cart,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return AppBarApp();
                      }));
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSquareButton(
                    labelText: ' Ads',
                    icon: Icons.library_books,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return Ads();
                      }));
                    },
                  ),
                  _buildSquareButton(
                    labelText: ' Orders',
                    icon: Icons.trolley,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return Orders();
                      }));
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSquareButton(
                    labelText: ' Products',
                    icon: Icons.car_rental,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return Product();
                      }));
                    },
                  ),
                  _buildSquareButton(
                    labelText: ' Categories',
                    icon: Icons.category,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return Category();
                      }));
                    },
                  ),
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
              PreferredSize(
                preferredSize: Size.fromHeight(.0), // Adjust height as needed
                child: Container(
                  color: Colors.grey[200],
                  child: const TabBar(
                    tabs: [
                      Tab(text: 'Overview'),
                      Tab(text: 'Revenues'),
                      Tab(text: 'Ads'),
                      Tab(text: 'Monthly Visits'),
                    ],
                    labelColor: Colors.black,
                    indicatorColor: Colors.orange,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 350, // Adjust height as needed
                child: TabBarView(
                  children: [
                    BarChartWidget(), // Bar chart widget
                    _buildRevenueContent(),
                    PieChartWidget(), // Pie chart widget
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return AdPost1();
                  }));
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

  Widget _buildRevenueContent() {
    // Build content for Revenue tab
    return Center(
      child: Text('Revenue Content Here'),
    );
  }

  Widget _buildMonthlyVisitsContent() {
    // Build content for Monthly Visits tab
    return Center(
      child: Text('Monthly Visits Content Here'),
    );
  }

  Widget _buildSquareButton({
    required String labelText,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
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
      ),
    );
  }
}
