import 'package:flutter/material.dart';
import 'package:my_app/admin_page.dart';
/*import 'package:my_app/login_page.dart';
import 'package:my_app/screens/sign_in1.dart';
import 'package:my_app/screens/manage_accounts.dart';
import 'package:my_app/screens/sellers.dart';
import 'package:my_app/screens/ads.dart';*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: AdminPage(),
    );
  }
}
