import 'package:flutter/material.dart';

class MyButtonHome extends StatelessWidget {
  final String imageNet;
  final VoidCallback onPressed;
  const MyButtonHome(
      {super.key, required this.imageNet, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),

        backgroundColor: const Color.fromARGB(255, 252, 248, 192),
        // Establece la forma circular
        padding: const EdgeInsets.all(0),
        //elevation: 10,

        side: const BorderSide(
          color: Color.fromARGB(255, 145, 152, 252),
        ),
      ),
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          //shape: BoxShape.circle, // Establece la forma circular
          image: DecorationImage(
            image: NetworkImage(imageNet),
          ),
        ),
      ),
    );
  }
}
