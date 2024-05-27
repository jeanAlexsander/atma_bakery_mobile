import 'package:flutter/material.dart';

class GeneralBottomNavBar extends StatefulWidget {
  const GeneralBottomNavBar({super.key, required this.onTapChangeIndex});

  final Function(int) onTapChangeIndex;
  @override
  State<GeneralBottomNavBar> createState() => _GeneralBottomNavBarState();
}

class _GeneralBottomNavBarState extends State<GeneralBottomNavBar> {
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
              widget.onTapChangeIndex(0),
            },
            icon: const Icon(Icons.home),
          ),
          IconButton(
            onPressed: () => {
              widget.onTapChangeIndex(1),
            },
            icon: const Icon(Icons.file_copy_sharp),
          ),
          IconButton(
            onPressed: () => {
              widget.onTapChangeIndex(2),
            },
            icon: const Icon(Icons.shopping_bag),
          ),
          IconButton(
            onPressed: () => {
              widget.onTapChangeIndex(3),
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
