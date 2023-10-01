import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Configuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final themeProvider = context.read<ThemeProvider>();
    //final daltonismProvider = context.read<DaltonismProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
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
