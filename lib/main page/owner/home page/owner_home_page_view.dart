import 'package:atma_bakery_mobile/main%20page/mo/laporan/laporan_main_view.dart';
import 'package:atma_bakery_mobile/main%20page/owner/component/owner_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class OwnerHomePage extends StatefulWidget {
  const OwnerHomePage({super.key});

  @override
  State<OwnerHomePage> createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage> {
  int index = 0;

  final _pages = <Widget>[
    const Center(
      child: Text("Home"),
    ),
    const Center(
      child: Text("Order"),
    ),
    const LaporanMainView(),
    const Center(
      child: Text("Profile"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _pages[index],
        ),
        bottomNavigationBar: OwnerBottomNavBar(
          onTabSeleted: (p0) {
            setState(() {
              index = p0;
            });
          },
        ),
      ),
    );
  }
}
