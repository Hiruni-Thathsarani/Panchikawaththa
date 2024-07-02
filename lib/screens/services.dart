import 'package:flutter/material.dart';
import 'package:my_app/screens/admin_page.dart';
import 'package:my_app/screens/services_page2.dart';

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ServicesListPage(),
    );
  }
}

class ServicesListPage extends StatelessWidget {
  final List<Vehicle> vehicles = [
    Vehicle(
      title: 'Engine Oil Change',
      sellerId: 'Seller id: 1',
      description: 'Complete engine oil change service',
      imageUrl:
          'https://example.com/aether450x.png', // Replace with actual image URL
    ),
    Vehicle(
      title: 'Brake Inspection',
      sellerId: 'Seller id: 2',
      description: 'Thorough brake inspection and replacement',
      imageUrl:
          'https://example.com/teslamodelx.png', // Replace with actual image URL
    ),
    Vehicle(
      title: 'Battery Check',
      sellerId: 'Seller id: 3',
      description: 'Battery health check and replacement',
      imageUrl:
          'https://example.com/hyundaicreta.png', // Replace with actual image URL
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return const AdminPage();
            }));
          },
        ),
        title: const Text(
          'Services',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.notifications, color: Colors.black),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
             onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return ScheduleServiceApp();
            }));
          }
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = vehicles[index];
          return VehicleCard(vehicle: vehicle);
        },
      ),
    );
  }
}

class Vehicle {
  final String title;
  final String sellerId;
  final String description;
  final String imageUrl;

  Vehicle({
    required this.title,
    required this.sellerId,
    required this.description,
    required this.imageUrl,
  });
}

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;

  VehicleCard({required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(vehicle.imageUrl, width: 30, height: 30),
        title: Text(vehicle.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(vehicle.sellerId),
            Text('Description: ${vehicle.description}'),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return ScheduleServiceApp();
            }));
          }
      ),
    );
  }
}
