import 'package:atma_bakery_mobile/main%20page/mo/component/mo_bottom_nav_bar.dart';
import 'package:atma_bakery_mobile/main%20page/mo/laporan/laporan_main_view.dart';
import 'package:atma_bakery_mobile/main%20page/mo/presensi/presensi_view.dart';
import 'package:flutter/material.dart';

class MOHomepage extends StatefulWidget {
  const MOHomepage({super.key});

  @override
  State<MOHomepage> createState() => _MOHomepageState();
}

class _MOHomepageState extends State<MOHomepage> {
  final pages = <Widget>[
    const LaporanMainView(),
    const PresensiView(),
    const Text("Cart"),
    const Text("Profile"),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: pages[index],
        ),
        bottomNavigationBar: MOBottomNavBar(
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
