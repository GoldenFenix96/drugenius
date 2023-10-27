import 'package:drugenius/Paginas/nav_videos/videos.dart';
import 'package:flutter/material.dart';
//import 'package:interfaces_video_podcast/class/desing_example.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget2 extends StatefulWidget {
  const VideoPlayerWidget2({super.key});

  @override
  State<VideoPlayerWidget2> createState() => _VideoPlayerWidgetState2();
}

class _VideoPlayerWidgetState2 extends State<VideoPlayerWidget2> {
  late VideoPlayerController _videoPlayerController2;

  @override
  void initState() {
    super.initState();

    _videoPlayerController2 =
        VideoPlayerController.asset('assets/video/Video1.mp4')
          ..initialize().then((_) {
            _videoPlayerController2.play();
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController2
        .dispose(); // Aquí detenemos y liberamos los recursos del reproductor.
  }

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
                "Reproductor",
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
                  MaterialPageRoute(builder: (context) => const Videos()));
            },
          ),
        ),
        body: Center(
          child: _videoPlayerController2.value.isInitialized
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AspectRatio(
                        aspectRatio: _videoPlayerController2.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController2)),
                    const Padding(
                      padding: EdgeInsets.all(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(70, 70)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)))),
                            onPressed: () {
                              _videoPlayerController2.pause();
                            },
                            child: const Icon(Icons.pause)),
                        const Padding(padding: EdgeInsets.all(2)),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(70, 70)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)))),
                            onPressed: () {
                              _videoPlayerController2.play();
                            },
                            child: const Icon(Icons.play_arrow)),
                        const Padding(padding: EdgeInsets.all(2)),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.yellowAccent),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(70, 70)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)))),
                            onPressed: () {
                              _videoPlayerController2.seekTo(Duration(
                                  seconds: _videoPlayerController2
                                          .value.position.inSeconds -
                                      2));
                            },
                            child: const Icon(Icons.fast_rewind)),
                        const Padding(padding: EdgeInsets.all(2)),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.yellowAccent),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    const Size(70, 70)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)))),
                            onPressed: () {
                              _videoPlayerController2.seekTo(Duration(
                                  seconds: _videoPlayerController2
                                          .value.position.inSeconds +
                                      2));
                            },
                            child: const Icon(Icons.fast_forward)),
                      ],
                    )
                  ],
                )
              : Container(),
        ));
  }
}
