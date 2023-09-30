import 'package:flutter/material.dart';

class Otherpage extends StatelessWidget {
  const Otherpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hola'),
      ),
      body: const Center(
        child: Text('Hola, estoy en otra página'),
      ),
    );
  }
}
