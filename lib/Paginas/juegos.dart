import 'dart:math';

import 'package:flutter/material.dart';

class Juegos extends StatelessWidget {
  const Juegos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sopa de Letras'),
        ),
        body: const SopaDeLetras(),
      ),
    );
  }
}

class SopaDeLetras extends StatefulWidget {
  const SopaDeLetras({super.key});

  @override
  State<SopaDeLetras> createState() {
    return _SopaDeLetras();
  }
}

class _SopaDeLetras extends State<SopaDeLetras> {
  final List<String> palabras = [
    'FLUTTER',
    'DART',
    'MOBILE',
    'APP',
    'DEVELOPMENT'
  ];
  final int gridSize = 10;
  final List<List<String>> grid =
      List.generate(10, (row) => List.generate(10, (col) => ''));

  @override
  void initState() {
    super.initState();
    generarCuadricula();
    colocarPalabras();
  }

  void generarCuadricula() {
    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        grid[row][col] = String.fromCharCode(
            Random().nextInt(26) + 65); // Letras aleatorias de la A a la Z
      }
    }
  }

  void colocarPalabras() {
    for (String palabra in palabras) {
      bool colocada = false;
      while (!colocada) {
        final bool horizontal =
            Random().nextBool(); // Colocar horizontal o verticalmente
        final int maxPos = gridSize - (horizontal ? palabra.length : 1);
        final int row = Random().nextInt(gridSize);
        final int col = Random().nextInt(maxPos);
        if (puedeColocarPalabra(palabra, row, col, horizontal)) {
          for (int i = 0; i < palabra.length; i++) {
            grid[row + (horizontal ? 0 : i)][col + (horizontal ? i : 0)] =
                palabra[i];
          }
          colocada = true;
        }
      }
    }
    setState(() {});
  }

  bool puedeColocarPalabra(String palabra, int row, int col, bool horizontal) {
    if (horizontal) {
      for (int i = 0; i < palabra.length; i++) {
        if (grid[row][col + i] != '' && grid[row][col + i] != palabra[i]) {
          return false;
        }
      }
    } else {
      for (int i = 0; i < palabra.length; i++) {
        if (grid[row + i][col] != '' && grid[row + i][col] != palabra[i]) {
          return false;
        }
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            'Encuentra las palabras:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridSize,
              ),
              itemBuilder: (context, index) {
                final row = index ~/ gridSize;
                final col = index % gridSize;
                return Center(
                  child: Text(
                    grid[row][col],
                    style: const TextStyle(fontSize: 24),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Palabras encontradas:',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: palabras.map((palabra) {
              final bool encontrada = palabraEncontrada(palabra);
              return Chip(
                label: Text(
                  palabra,
                  style: TextStyle(
                    fontWeight:
                        encontrada ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              reiniciarJuego();
            },
            child: const Text('Reiniciar'),
          ),
        ],
      ),
    );
  }

  bool palabraEncontrada(String palabra) {
    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        if (encuentraPalabraEnPosicion(palabra, row, col, true) ||
            encuentraPalabraEnPosicion(palabra, row, col, false)) {
          return true;
        }
      }
    }
    return false;
  }

  bool encuentraPalabraEnPosicion(
      String palabra, int row, int col, bool horizontal) {
    if (horizontal) {
      if (col + palabra.length > gridSize) return false;
      for (int i = 0; i < palabra.length; i++) {
        if (grid[row][col + i] != palabra[i]) {
          return false;
        }
      }
    } else {
      if (row + palabra.length > gridSize) return false;
      for (int i = 0; i < palabra.length; i++) {
        if (grid[row + i][col] != palabra[i]) {
          return false;
        }
      }
    }
    return true;
  }

  void reiniciarJuego() {
    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        grid[row][col] = String.fromCharCode(Random().nextInt(26) + 65);
      }
    }
    colocarPalabras();
  }
}
