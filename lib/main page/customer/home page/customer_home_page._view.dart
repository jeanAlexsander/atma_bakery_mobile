import 'package:atma_bakery_mobile/main%20page/customer/component/customer_bottom_nav.dart';
import 'package:flutter/material.dart';

class CustomerHomepage extends StatefulWidget {
  const CustomerHomepage({super.key});

  @override
  State<CustomerHomepage> createState() => _CustomerHomepagegState();
}

class _CustomerHomepagegState extends State<CustomerHomepage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Customer Homepage'),
        ),
        bottomNavigationBar: CustomerBottomNavBar(),
      ),
    );
  }
}
