import 'package:drugenius/Paginas/nav_videos/video_player.dart';
import 'package:drugenius/Paginas/nav_videos/video_player2.dart';
import 'package:drugenius/Paginas/video_audio.dart';
import 'package:flutter/material.dart';

class Videos extends StatefulWidget {
  const Videos({super.key});

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Row(
          children: [
            const Text(
              "Lista de videos",
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
                        builder: (context) => const VideoPlayerWidget()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.grey),
                child: const Center(
                    child: Text(
                  "Introduccion a Drugenius ",
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
                        builder: (context) => const VideoPlayerWidget2()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.grey),
                child: const Center(
                    child: Text(
                  "AINES Generalidades ",
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
