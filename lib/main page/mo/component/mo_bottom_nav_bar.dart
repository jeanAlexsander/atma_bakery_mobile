import 'package:flutter/material.dart';

class MOBottomNavBar extends StatefulWidget {
  const MOBottomNavBar({super.key});

  @override
  State<MOBottomNavBar> createState() => _MOBottomNavBarState();
}

class _MOBottomNavBarState extends State<MOBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.09,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.home),
          Icon(Icons.file_copy_sharp),
          Icon(Icons.shopping_bag),
          Icon(Icons.person),
        ],
      ),
    );
  }
}
