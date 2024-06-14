// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:my_app/admin_page.dart';
import 'package:my_app/login.dart';
import 'package:my_app/screens/manage_accounts.dart';
import 'package:my_app/screens/post_success.dart';
import 'package:my_app/screens/profile_page.dart';
import 'package:my_app/screens/sellers.dart';
import 'package:my_app/screens/ads.dart';
import 'package:my_app/screens/adpost1.dart';
import 'package:my_app/screens/SplashScreen.dart';

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
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 25, 20, 19)),
        useMaterial3: true,
      ),
      home: AdminPage(),
    );
  }
}
