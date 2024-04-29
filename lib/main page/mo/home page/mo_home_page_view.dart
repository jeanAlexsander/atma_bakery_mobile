import 'package:atma_bakery_mobile/main%20page/mo/component/mo_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MOHomepage extends StatefulWidget {
  const MOHomepage({super.key});

  @override
  State<MOHomepage> createState() => _MOHomepageState();
}

class _MOHomepageState extends State<MOHomepage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("MO Homepage"),
        ),
        bottomNavigationBar: MOBottomNavBar(),
      ),
    );
  }
}
