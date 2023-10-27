//import 'package:card_swiper/card_swiper.dart';
import 'package:drugenius/Paginas/Nav_Bar.dart';
import 'package:drugenius/Paginas/addMulti.dart';
import 'package:drugenius/Paginas/nav_audios/audios.dart';
import 'package:drugenius/Paginas/nav_videos/videos.dart';
import 'package:flutter/material.dart';

class VideoAudio extends StatefulWidget {
  const VideoAudio({super.key});

  @override
  State<VideoAudio> createState() => _VideoAudioState();
}

List<String> imagen = [
  "https://picsum.photos/id/1/400/300",
  "https://picsum.photos/id/2/400/300",
];

class _VideoAudioState extends State<VideoAudio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          "Mutimedia",
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 22, 112, 177),
        elevation: 0,
      ),
      drawer: const NavBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, mainAxisSpacing: 10, crossAxisSpacing: 10),
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Videos()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent,
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Audios()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlueAccent,
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

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddMulti()));
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
                      Icons.add,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      "Carga",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Text(
                      "Multimedia",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            //swiperBox(),
            //swiperBox(),
          ],
        ),
      ),
    );
  }
}
