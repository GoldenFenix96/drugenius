import 'package:drugenius/Firebase_Services/firebase_services.dart';
import 'package:drugenius/Paginas/nav_videos/video_player.dart';
import 'package:drugenius/Paginas/video_audio.dart';
import 'package:flutter/material.dart';

class Videos extends StatefulWidget {
  const Videos({super.key});

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  Firebase_services fs = Firebase_services();
  List<Map<String, dynamic>> videos = [];

  @override
  void initState() {
    super.initState();
    obtenerVideos();
  }

  Future<void> obtenerVideos() async {
    final videosObtenidos = await fs.getVideos();
    if (videosObtenidos != null) {
      setState(() {
        videos = videosObtenidos;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text("Lista de videos"),
        backgroundColor: const Color.fromARGB(255, 22, 112, 177),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const VideoAudio()));
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          // ignore: unused_local_variable
          final id = video['id'];
          final nombre = video['nombre'];
          final videoUrls = video['videoUrls'];

          return Column(
            children: [
              Container(
                height: 70,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 237, 237, 237),
                ),
                child: Center(
                  child: ListTile(
                    title: Text(
                      nombre,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      // Navegar a la pantalla de reproducción de video
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              VideoPlayerWidget(videoUrls: videoUrls),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          );
        },
      ),
    );
  }
}
