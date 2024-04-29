import 'package:atma_bakery_mobile/main%20page/admin/components/buttom_nav_bar.dart';
import 'package:flutter/material.dart';

class AdminHomepage extends StatefulWidget {
  const AdminHomepage({super.key});

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Admin Homepage'),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
