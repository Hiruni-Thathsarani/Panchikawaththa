import 'package:flutter/material.dart';

class Ads extends StatefulWidget {
  const Ads({Key? key}) : super(key: key);

  @override
  State<Ads> createState() => _AdminPageState();
}

class _AdminPageState extends State<Ads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Ads'),
          ],
        ),
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
}
