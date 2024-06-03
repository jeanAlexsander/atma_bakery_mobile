import 'package:flutter/material.dart';

class OwnerBottomNavBar extends StatefulWidget {
  const OwnerBottomNavBar({super.key, required this.onTabSeleted});

  final Function(int) onTabSeleted;

  @override
  State<OwnerBottomNavBar> createState() => _OwnerBottomNavBarState();
}

class _OwnerBottomNavBarState extends State<OwnerBottomNavBar> {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () => {
              widget.onTabSeleted(0),
            },
            icon: const Icon(Icons.home),
          ),
          IconButton(
            onPressed: () => {
              widget.onTabSeleted(1),
            },
            icon: const Icon(Icons.file_copy_sharp),
          ),
          IconButton(
            onPressed: () => {
              widget.onTabSeleted(2),
            },
            icon: const Icon(Icons.shopping_bag),
          ),
          IconButton(
            onPressed: () => {
              widget.onTabSeleted(3),
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
