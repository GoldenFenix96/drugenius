import 'package:drugenius/main.dart';
import 'package:flutter/material.dart';

class BlankPageCalculadora extends StatelessWidget {
  const BlankPageCalculadora({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text("Calculadora de dosis"),
        backgroundColor: const Color.fromARGB(255, 22, 112, 177),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(253, 200, 66, 0.143),
            ],
            stops: [0.1, 0.9],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset('assets/images/CALCULADORA2.PNG'),
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(
                child: Text(
                  'Página en desarrollo',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 15),
              const CircularProgressIndicator(
                value: null,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const DrugeniusMenu(), // Reemplaza con la pantalla deseada
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 22, 112, 177),
                  ),
                ),
                child: const Text(
                  'Volver',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
