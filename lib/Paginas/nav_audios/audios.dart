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
        title: Row(
          children: [
            const Text(
              "Reproductor de audio",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 22, 112, 177),
        elevation: 0,
        actions: <Widget>[],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            dispose();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => VideoAudio()));
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
                    borderRadius: BorderRadius.circular(5), color: Colors.grey),
                child: const Center(
                    child: Text(
                  "Amigos emprendedores ",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
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
                    borderRadius: BorderRadius.circular(5), color: Colors.grey),
                child: const Center(
                    child: Text(
                  "Lagrimas y risas ",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
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
                    borderRadius: BorderRadius.circular(5), color: Colors.grey),
                child: const Center(
                    child: Text(
                  "Las dos caras de la moneda",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
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
                    borderRadius: BorderRadius.circular(5), color: Colors.grey),
                child: const Center(
                    child: Text(
                  "La importancia de Farmacologia ",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
