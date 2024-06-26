import 'package:flutter/material.dart';
import 'package:my_app/admin_page.dart';

class VehicleDetails extends StatelessWidget {
  final List<Map<String, dynamic>> carOffers = [
    {"name": "user1", "price": 54, "details": "Manual - Sedan"},
    {"name": "user2", "price": 67, "details": "Automatic - Hatch - 100km incl."},
    {"name": "user3", "price": 75, "details": "Automatic - SUV"},
    {"name": "user4", "price": 93, "details": "Automatic - SUV"},
    {"name": "user5", "price": 106, "details": "Automatic - Sedan"},
    // Add more offers here
  ];

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
                    onChanged: (value) {
                      // Implement your search functionality here
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: carOffers.length,
              itemBuilder: (context, index) {
                final offer = carOffers[index];
                return ListTile(
                  leading: Image.network(
                    'https://via.placeholder.com/150', // Replace with your image URL
                    width: 50,
                    height: 50,
                  ),
                  title: Text(offer['name']),
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
                    // Handle item tap
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
