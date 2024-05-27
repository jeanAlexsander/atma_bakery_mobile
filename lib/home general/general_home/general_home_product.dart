import 'package:atma_bakery_mobile/home%20general/component/bottom_generar_navbar.dart';
import 'package:atma_bakery_mobile/home%20general/product_page/product_page_view.dart';
import 'package:flutter/material.dart';

class GeneralHomePage extends StatefulWidget {
  const GeneralHomePage({super.key});

  @override
  State<GeneralHomePage> createState() => _GeneralHomePageState();
}

class _GeneralHomePageState extends State<GeneralHomePage> {
  int index = 0;

  final _pages = <Widget>[
    const ProductPageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[index],
        bottomNavigationBar: GeneralBottomNavBar(
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
