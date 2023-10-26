import 'package:drugenius/main.dart';
import 'package:flutter/material.dart';

class BlankPageEvaluaciones extends StatelessWidget {
  const BlankPageEvaluaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 215, 135, 0.568),
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text("Evaluaciones"),
        backgroundColor: const Color.fromARGB(255, 22, 112, 177),
      ),
      body: Container(
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
                  child: Image.asset('assets/images/EVALUACIONES.png'),
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(
                child: Text('Página en desarrollo', style: TextStyle(fontSize: 18),),
              ),
              const SizedBox(height: 15),
              CircularProgressIndicator(
                value: null,
              ),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const DrugeniusMenu(), // Reemplaza con la pantalla deseada
                ),
              );},style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 22, 112, 177),
      
                          ),
              ) ,child: Text('Volver', style: TextStyle(fontSize: 18),),)
            ],
          ),
        ),
      ),
    );
  }
}