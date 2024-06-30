import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/admin_page.dart';
import 'package:my_app/screens/vehicle_details_2.dart';

class VehicleDetails extends StatefulWidget {
  @override
  _VehicleDetailsState createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  List<Map<String, dynamic>> carOffers = [];
  List<Map<String, dynamic>> filteredCarOffers = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
    searchController.addListener(() {
      filterSearchResults(searchController.text);
    });
  }

  Future<void> fetchData() async {
    try {
      var url = 'http://10.0.2.2:8000/vehicleDetails/vehicles'; // Replace with your backend endpoint
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        setState(() {
          carOffers = data.map((offer) => {
            'userId': offer['userId'].toString(),
            'price': offer['price'], // Assuming price is an int
            'details': offer['type'] + ' - ' + offer['model'], // Customize details as needed
            'type': offer['type'],
            'make': offer['make'],
            'model': offer['model'],
            'year': offer['year'], // Assuming year is an int
          }).toList();
          filteredCarOffers = carOffers;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void filterSearchResults(String query) {
    List<Map<String, dynamic>> filteredList = carOffers.where((offer) {
      return offer['details'].toLowerCase().contains(query.toLowerCase()) ||
             offer['userId'].toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredCarOffers = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add your drawer content here
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            color: Color(0xFFFF5C01), // Updated color
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                            return const AdminPage();
                          }));
                        },
                      ),
                      Expanded(
                        child: Text(
                          'Vehicle Details',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 48), // Placeholder to balance the row
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    controller: searchController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.white70),
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCarOffers.length,
              itemBuilder: (context, index) {
                final offer = filteredCarOffers[index];
                return ListTile(
                  leading: Image.network(
                    'https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?t=st=1719587210~exp=1719590810~hmac=47f1ed93ff752d44c74bdcd2975be13cc931419bbdf0102428030facaa458d97&w=740', // Replace with your image URL
                    width: 50,
                    height: 50,
                  ),
                  title: Text(offer['userId']),
                  subtitle: Text(offer['details']),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      // Handle the selected value
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem<String>(
                          value: 'price',
                          child: Text('Price: €${offer['price']}'),
                        ),
                      ];
                    },
                    icon: Icon(Icons.more_vert),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VehicleListPage(userId: offer['userId']),
                    ));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: VehicleDetails(),
  ));
}
