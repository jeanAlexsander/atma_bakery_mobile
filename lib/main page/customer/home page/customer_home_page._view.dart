import 'package:atma_bakery_mobile/main%20page/customer/component/customer_bottom_nav.dart';
import 'package:atma_bakery_mobile/main%20page/customer/customer%20profile/customer_profile_view.dart';
import 'package:atma_bakery_mobile/main%20page/customer/history/customer_history_view.dart';
import 'package:atma_bakery_mobile/main%20page/customer/pesanan%20dikirim/pesanan_dikirim_view.dart';
import 'package:flutter/material.dart';

class CustomerHomepage extends StatefulWidget {
  const CustomerHomepage({super.key});

  @override
  State<CustomerHomepage> createState() => _CustomerHomepagegState();
}

class _CustomerHomepagegState extends State<CustomerHomepage> {
  int index = 0;

  final pages = <Widget>[
    const Center(
      child: Text('Home'),
    ),
    const Center(
      child: CustomerHistoryView(),
    ),
    const Center(
      child: PesananDikirimView(),
    ),
    const Center(
      child: CustomerProfileView(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: pages[index],
        ),
        bottomNavigationBar: CustomerBottomNavBar(
          onTapChangeIndex: (p0) {
            setState(() {
              index = p0;
            });
          },
        ),
      ),
    );
  }
}
