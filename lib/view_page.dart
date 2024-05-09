import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          // Row to align back button, monitor icon, and text horizontally
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(
                    context); // Navigate back when back button is pressed
              },
              icon: Icon(Icons.arrow_back),
            ),
            Icon(Icons.monitor, color: Color(0xFFFF5C01)),
            SizedBox(width: 8),
            Text(
              'View',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildListItem('Accounts'),
                _buildListItem('Sellers'),
                _buildListItem('Buyers'),
                _buildListItem('Ads'),
                _buildListItem('Reviews'),
                _buildListItem('Sales'),
                _buildListItem('models'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                // Handle dashbord action here
              },
              icon: Icon(Icons.dashboard, color: Color(0xFFFF5C01)),
            ),
            IconButton(
              onPressed: () {
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
                // Handle  action here
              },
              icon: Icon(Icons.settings, color: Color(0xFFFF5C01)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Color(0xFFEBEBEB),
        ),
        child: ListTile(
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Handle button tap
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ViewPage(),
  ));
}
