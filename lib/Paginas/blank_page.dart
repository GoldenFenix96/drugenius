import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const Text(
          "Página en construcción",
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 85, 145, 214),
      ),
      body: Container(
        child: Center(
          child: SizedBox(
            width: 200,
            height: 200,
            child: Image.network(
                'https://icones.pro/wp-content/uploads/2022/02/services-parametres-et-icone-d-engrenage-gris.png'),
          ),
        ),
      ),
    );
  }
}
