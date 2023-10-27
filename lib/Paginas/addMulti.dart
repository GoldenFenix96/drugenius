// ignore_for_file: file_names

import 'package:drugenius/Paginas/audio_input.dart';
import 'package:drugenius/Paginas/video_audio.dart';
import 'package:drugenius/Paginas/video_input.dart';
import 'package:flutter/material.dart';

class AddMulti extends StatefulWidget {
  const AddMulti({super.key});

  @override
  State<AddMulti> createState() => _AddMultiState();
}

class _AddMultiState extends State<AddMulti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Row(
          children: [
            Text(
              "Cargar multimedia",
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, mainAxisSpacing: 10, crossAxisSpacing: 10),
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VideoInput()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlue,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.video_camera_front,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      "Video",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AudioInput()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.podcasts,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      "Podcast",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
