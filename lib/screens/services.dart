import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/screens/admin_page.dart';
import 'package:my_app/screens/services_page2.dart'; // Import ServiceDetails

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ServicesListPage(),
    );
  }
}

class ServicesListPage extends StatefulWidget {
  @override
  _ServicesListPageState createState() => _ServicesListPageState();
}

class _ServicesListPageState extends State<ServicesListPage> {
  late Future<List<Service>> futureServices;

  @override
  void initState() {
    super.initState();
    futureServices = fetchServices();
  }

  Future<List<Service>> fetchServices() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/admin/services-list'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((service) => Service.fromJson(service)).toList();
    } else {
      throw Exception('Failed to load services');
    }
  }

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
              return AdminPage();
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
              // Handle notification tap
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Service>>(
        future: futureServices,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No services found'));
          } else {
            List<Service> services = snapshot.data!;
            return ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return ServiceCard(service: service);
              },
            );
          }
        },
      ),
    );
  }
}

class Service {
  final int id;
  final String title;
  final String sellerId;
  final String description;
  final String imageUrl;

  Service({
    required this.id,
    required this.title,
    required this.sellerId,
    required this.description,
    required this.imageUrl,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['serviceId'],
      title: json['title'],
      sellerId: 'Seller id: ${json['sellerId']}',
      description: json['description'],
      imageUrl: json['imageUrl'] ?? 'https://example.com/default.png',
    );
  }
}

class ServiceCard extends StatelessWidget {
  final Service service;

  ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(service.imageUrl, width: 30, height: 30),
        title: Text(service.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(service.sellerId),
            Text('Description: ${service.description}'),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ServiceDetails(services: service),
          ));
        },
      ),
    );
  }
}
