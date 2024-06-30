import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/screens/Category.dart';
import 'package:my_app/screens/barchart.dart';
import 'package:my_app/screens/buyer.dart';
import 'package:my_app/screens/buyer2.dart';
import 'package:my_app/screens/manage_accounts.dart';
import 'package:my_app/screens/monthly_visits.dart';
import 'package:my_app/screens/piechart.dart';
import 'package:my_app/screens/search_page.dart';
import 'package:my_app/screens/sellerLocation.dart';
import 'package:my_app/screens/sparePartsDetails.dart';
import 'package:my_app/screens/vehicle_details.dart';
import 'package:my_app/screens/view_Analytics.dart'; // Update with your actual import paths

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late Future<Map<String, int>> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
  }

  Future<Map<String, int>> fetchData() async {
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/details');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return {
          'sellersCount': data['counts']['sellersCount'],
          'buyersCount': data['counts']['buyersCount'],
          'adsCount': data['counts']['adsCount'] ?? 0,
          'vehiclesCount': data['counts']['vehiclesCount'] ?? 0,
          'sparepartsCount': data['counts']['sparepartsCount'] ?? 0,
          'servicesCount': data['counts']['servicesCount'] ?? 0,
        };
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
        ),
        body: FutureBuilder<Map<String, int>>(
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              var data = snapshot.data!;
              return buildContent(data);
            } else {
              return const Center(
                child: Text('No data available'),
              );
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard, color: Color(0xFFFF5C01)),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete, color: Color(0xFFFF5C01)),
              label: 'Delete',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Color(0xFFFF5C01)),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Color(0xFFFF5C01)),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContent(Map<String, int> data) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              color: Color(0xFFEBEBEB),
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
          const Text(
            'Thathsarani_Mdh',
            style: TextStyle(fontSize: 13),
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const ViewAnalyticApp();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFFFF5C01),
                  minimumSize: const Size(150, 50),
                ),
                child: const Text('View Analytics'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const ManageAccount();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFFFF5C01),
                  minimumSize: const Size(150, 50),
                ),
                child: const Text('Manage Accounts'),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSquareButton(
                labelText: 'Sellers',
                count: data['sellersCount']!,
                icon: Icons.person,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return DashboardScreen();
                  }));
                },
              ),
              _buildSquareButton(
                labelText: 'Buyers',
                count: data['buyersCount']!,
                icon: Icons.shopping_cart,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return UsersPage();
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
                count: data['adsCount']!,
                icon: Icons.library_books,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const search_page();
                  }));
                },
              ),
              _buildSquareButton(
                labelText: 'Vehicle',
                count: data['vehiclesCount']!,
                icon: Icons.airport_shuttle_rounded,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return VehicleDetails();
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
                labelText: 'Spareparts',
                count: data['sparepartsCount']!,
                icon: Icons.car_rental,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return SparePartsApp();
                  }));
                },
              ),
              _buildSquareButton(
                labelText: 'Services',
                count: data['servicesCount']!,
                icon: Icons.add_business,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const Category();
                  }));
                },
              ),
            ],
          ),
          const SizedBox(height: 50),
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
            preferredSize: const Size.fromHeight(50),
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
            height: 350,
            child: TabBarView(
              children: [
                BarChartWidget(), // Replace with your chart widgets
                PieChartWidget(),
                _buildMonthlyVisitsContent(),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildSquareButton({
    required String labelText,
    required int count,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    bool isHovered = false;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              isHovered = false;
            });
          },
          child: GestureDetector(
            onTap: onPressed,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isHovered ? 140 : 130, // Adjust button width here
              height: isHovered ? 110 : 100, // Adjust button height here
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isHovered
                    ? const Color(0xFFFFD700)
                    : const Color(0xFFEBEBEB),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon,
                          color: isHovered ? Colors.white : Colors.black),
                      const SizedBox(width: 5),
                      Text(
                        labelText,
                        style: TextStyle(
                          color: isHovered ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$count', // Display the count
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: isHovered ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
}
