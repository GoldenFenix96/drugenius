import 'package:drugenius/Paginas/nav_audios/audioManager.dart';
import 'package:drugenius/Paginas/nav_audios/audioManager2.dart';
import 'package:drugenius/Paginas/nav_audios/audioManager3.dart';
import 'package:drugenius/Paginas/nav_audios/audioManager4.dart';
import 'package:drugenius/Paginas/video_audio.dart';
import 'package:flutter/material.dart';

class Audios extends StatefulWidget {
  const Audios({super.key});

  @override
  State<Audios> createState() => _VideosState();
}

class _VideosState extends State<Audios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Row(
          children: [
            Text(
              "Reproductor de audio",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 22, 112, 177),
        elevation: 0,
        actions: const <Widget>[],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            dispose();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const VideoAudio()));
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AudioManager()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.lightBlue),
                child: Row(
                  // Cambio hecho aquí
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Imagen
                    Image.network(
                      'https://i.ibb.co/0FZPjNw/Logo-Drugenius.png', // Reemplaza con la ruta de tu imagen
                      height: double.infinity,
                      width: 100.0,
                    ),
                    const SizedBox(
                        width: 10.0), // Espacio entre la imagen y el texto
                    // Texto
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Amigos emprendedores",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AudioManager2()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.lightBlue),
                child: Row(
                  // Cambio hecho aquí
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Imagen
                    Image.network(
                      'https://i.ibb.co/0FZPjNw/Logo-Drugenius.png', // Reemplaza con la ruta de tu imagen
                      height: double.infinity,
                      width: 100.0,
                    ),
                    const SizedBox(
                        width: 10.0), // Espacio entre la imagen y el texto
                    // Texto
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Lagrimas y risas",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AudioManager3()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.lightBlue),
                child: Row(
                  // Cambio hecho aquí
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Imagen
                    Image.network(
                      'https://i.ibb.co/0FZPjNw/Logo-Drugenius.png', // Reemplaza con la ruta de tu imagen
                      height: double.infinity,
                      width: 100.0,
                    ),
                    const SizedBox(
                        width: 10.0), // Espacio entre la imagen y el texto
                    // Texto
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Dos caras de la moneda",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AudioManager4()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.lightBlue),
                child: Row(
                  // Cambio hecho aquí
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Imagen
                    Image.network(
                      'https://i.ibb.co/0FZPjNw/Logo-Drugenius.png', // Reemplaza con la ruta de tu imagen
                      height: double.infinity,
                      width: 100.0,
                    ),
                    const SizedBox(
                        width: 10.0), // Espacio entre la imagen y el texto
                    // Texto
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Importancia de farmacologia",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
