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
       backgroundColor: Color.fromARGB(255, 85, 145, 214),
      elevation: 10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Lista",
              style: TextStyle(fontSize: 35, color: Colors.black),
            ),
            
            Text(
              "de",
              style: TextStyle(fontSize: 35, color: Colors.grey),
            ),

            Text(
              "Audios",
              style: TextStyle(fontSize: 35, color: Colors.white),
            )
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AudioManager()));
                },
            child: Container(
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey),
              child: Center(child: Text("Amigos emprendedores ", style: TextStyle(fontSize: 25, color: Colors.white),)),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AudioManager2()));
                },
            child: Container(
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey),
              child: Center(child: Text("Lagrimas y risas ", style: TextStyle(fontSize: 25, color: Colors.white),)),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AudioManager3()));
                },
            child: Container(
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey),
              child: Center(child: Text("Las dos caras de la moneda", style: TextStyle(fontSize: 25, color: Colors.white),)),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AudioManager4()));
                },
            child: Container(
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey),
              child: Center(child: Text("La importancia de Farmacologia ", style: TextStyle(fontSize: 25, color: Colors.white),)),
            ),
          ),
        ),

      ],
     ),
    );
  }
}