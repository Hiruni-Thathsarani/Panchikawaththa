import 'package:flutter/material.dart';
import 'package:my_app/screens/Category.dart';
import 'package:my_app/screens/orders.dart';
import 'package:my_app/screens/product.dart';
import 'package:my_app/screens/search_page.dart';
import 'package:my_app/screens/sellers.dart';
import 'package:my_app/view_page.dart';
import 'package:my_app/screens/manage_accounts.dart';
import 'package:my_app/screens/adpost1.dart';
import 'package:my_app/screens/piechart.dart';
import 'package:my_app/screens/barchart.dart';
import 'package:my_app/screens/monthly_visits.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  // Placeholder counts, replace these with actual data from your backend
  int sellersCount = 10;
  int buyersCount = 25;
  int adsCount = 15;
  int ordersCount = 20;
  int productsCount = 30;
  int categoriesCount = 5;

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
                icon: const Icon(Icons.arrow_back),
              ),
              const Text('My profile'),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 1), // Container for profile picture icon
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: Color(0xFFEBEBEB), // Square-shaped layer color
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    // Handle profile picture upload action here
                  },
                  iconSize: 80,
                  icon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 5),
              // Upload icon above two buttons
              const Text(
                'Thathsarani_Mdh', // Replace with actual user's name
                style: TextStyle(fontSize: 13), // Set text size
              ),
              const Text(
                'hirunithathsarani2001@gmail.com',
                style: TextStyle(fontSize: 11),
              ),
              const SizedBox(height: 20),
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
                      backgroundColor: const Color(0xFFFF5C01),
                      minimumSize:
                          const Size(150, 50), // Adjust button size here
                    ),
                    child: const Text('View Analytics'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const ManageAccount();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFFFF5C01),
                      minimumSize:
                          const Size(150, 50), // Adjust button size here
                    ),
                    child: const Text('Manage Accounts'),
                  ),
                ],
              ),
              const SizedBox(height: 45),
              // Three square boxes with text labels
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSquareButton(
                    labelText: 'Sellers',
                    count: sellersCount,
                    icon: Icons.person,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const AppBarApp();
                      }));
                    },
                  ),
                  _buildSquareButton(
                    labelText: 'Buyers',
                    count: buyersCount,
                    icon: Icons.shopping_cart,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const AppBarApp();
                      }));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSquareButton(
                    labelText: 'Ads',
                    count: adsCount,
                    icon: Icons.library_books,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const search_page();
                      }));
                    },
                  ),
                  _buildSquareButton(
                    labelText: 'Orders',
                    count: ordersCount,
                    icon: Icons.trolley,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const Orders();
                      }));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSquareButton(
                    labelText: 'Products',
                    count: productsCount,
                    icon: Icons.car_rental,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const Product();
                      }));
                    },
                  ),
                  _buildSquareButton(
                    labelText: 'Categories',
                    count: categoriesCount,
                    icon: Icons.category,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const Category();
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
                preferredSize:
                    const Size.fromHeight(50), // Adjust height as needed
                child: Container(
                  color: Colors.grey[200],
                  child: const TabBar(
                    tabs: [
                      Tab(text: 'Overview'),
                      Tab(text: 'Popular Ads'),
                      Tab(text: 'Monthly Visits'),
                    ],
                    labelColor: Colors.black,
                    indicatorColor: Color(0xFFFF5C01),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 350, // Adjust height as needed
                child: TabBarView(
                  children: [
                    BarChartWidget(), // Bar chart widget
                    PieChartWidget(), // Pie chart widget
                    _buildMonthlyVisitsContent(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Bar Chart
            ],
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.dashboard, color: Color(0xFFFF5C01)),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  // var iconColor = Colors.green; // Change the color to red
                });
                // Handle delete action here
              },
              icon: const Icon(Icons.delete, color: Color(0xFFFF5C01)),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const AdPost1();
                }));
              },
              icon: const Icon(Icons.add, color: Color(0xFFFF5C01)),
            ),
            IconButton(
              onPressed: () {
                // Handle action here
              },
              icon: const Icon(Icons.settings, color: Color(0xFFFF5C01)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthlyVisitsContent() {
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

  Widget _buildSquareButton({
    required String labelText,
    required int count,
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
          color: const Color(0xFFEBEBEB),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon),
                const SizedBox(width: 5),
                Text(labelText),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              '$count', // Display the count
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
