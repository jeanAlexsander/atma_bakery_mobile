import 'package:flutter/material.dart';

class CustomerBottomNavBar extends StatefulWidget {
  const CustomerBottomNavBar({super.key});

  @override
  State<CustomerBottomNavBar> createState() => _CustomerBottomNavBarState();
}

class _CustomerBottomNavBarState extends State<CustomerBottomNavBar> {
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
