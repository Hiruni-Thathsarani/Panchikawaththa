import 'package:flutter/material.dart';
import 'package:my_app/admin_page.dart';

void main() {
  runApp(Buyer());
}

class Buyer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SellersScreen(),
    );
  }
}

class SellersScreen extends StatelessWidget {
  final List<Map<String, String>> sellers = [
    {'name': 'Jordan Smith', 'id': '3121', 'image': 'assets/img/jordan.png'},
    {'name': 'Emily Davis', 'id': '1266', 'image': 'assets/img/emily.png'},
    {
      'name': 'Jessica Rodriguez',
      'id': '3321',
      'image': 'assets/img/jessica.png'
    },
    {'name': 'David Brown', 'id': '1100', 'image': 'assets/img/david.png'},
    {
      'name': 'Christopher Wilson',
      'id': '2211',
      'image': 'assets/img/christopher.png'
    },
    {'name': 'Ashley Gonzalez', 'id': '1466', 'image': 'assets/img/ashley.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const AdminPage();
                }));
              },
            ),
            const SizedBox(
                width: 10), // Add some space between the icon and the title
            const Text('Buyers'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: sellers.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(sellers[index]['image']!),
                      ),
                      title: Text(sellers[index]['name']!),
                      subtitle: Text('User ID: ${sellers[index]['id']}'),
                      trailing: const Icon(Icons.visibility),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, color: Color(0xFFFF5C01)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box, color: Color(0xFFFF5C01)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Color(0xFFFF5C01)),
            label: '',
          ),
        ],
        currentIndex: 2, // Set the current index to the appropriate tab
      ),
    );
  }
}
