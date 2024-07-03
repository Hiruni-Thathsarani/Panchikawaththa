import 'package:flutter/material.dart';
import 'services.dart'; // Import the Vehicle class

class ServiceDetails extends StatelessWidget {
  final Service services;

  ServiceDetails({required this.services});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(services.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ServicedetailsPage(services: services),
    );
  }
}

class ServicedetailsPage extends StatelessWidget {
  final Service services;

  ServicedetailsPage({required this.services});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Image.network(services.imageUrl, height: 150),
                const SizedBox(height: 8),
                Text(
                  services.title,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(services.sellerId),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text('Business Name', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 4),
          const Text('Brake Pads',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: Text('Date'), // You can replace 'Date' with actual data
                  onTap: () {
                    // Handle date selection
                  },
                ),
              ),
              Expanded(
                child: ListTile(
                  leading: const Icon(Icons.access_time),
                  title: Text('Time'), // You can replace 'Time' with actual data
                  onTap: () {
                    // Handle time selection
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
        const SizedBox(height: 16),
          const Text('Service Center Location', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 4),
          const Text('Aether Center Chennai',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const Text('Description', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 4),
          Text(
            services.description,
            style: const TextStyle(fontSize: 16),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
