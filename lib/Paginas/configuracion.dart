import 'package:drugenius/Paginas/Nav_Bar.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
);

class Configuracion extends StatelessWidget {
  const Configuracion({super.key});

  @override
  Widget build(BuildContext context) {
    lightTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 84, 132, 160),
        title: Image.network(
          'https://i.ibb.co/0FZPjNw/Logo-Drugenius.png',
          width: 300,
          height: 200,
        ),
      ),
      drawer: const NavBar(),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Modo Oscuro'),
            value: false,
            onChanged: (value) {},
          ),
          SwitchListTile(
            title: const Text('Modo Daltonismo'),
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
