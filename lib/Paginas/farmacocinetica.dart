import 'package:flutter/material.dart';

class Farmacocinetica extends StatelessWidget {
  const Farmacocinetica({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Farmacocinética', style: TextStyle(color: Colors.red)),
        backgroundColor: const Color.fromARGB(255, 85, 145, 214),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Paracetamol',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.purple, // Color morado
              ),
            ),
            Image.network(
              'https://www.fahorro.com/media/catalog/product/cache/3fba745dcec88e97bfe808bedc471260/7/5/7506472803833_1_1.jpg', // Asegúrate de que esta ruta sea correcta
              width: 100, // Ajusta el tamaño de la imagen según tus necesidades
              height: 100,
            ),
            const SizedBox(height: 16.0),
            DropdownButton<String>(
              hint: const Text('Selecciona una sección'),
              items: <String>[
                'Liberación',
                'Absorción',
                'Distribución',
                'Metabolismo',
                'Excreción',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Aquí puedes manejar la selección de la sección
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Texto de la sección'),
              keyboardType: TextInputType.text,
              maxLines:
                  3, // Puedes ajustar el número de líneas según tus necesidades
            ),
          ],
        ),
      ),
    );
  }
}
