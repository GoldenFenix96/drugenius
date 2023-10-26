import 'package:drugenius/Paginas/nav_videos/videos.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final List<String> videoUrls;
  const VideoPlayerWidget({super.key, required this.videoUrls});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.networkUrl(widget.videoUrls[0] as Uri)
          ..initialize().then((_) {
            _videoPlayerController.play();
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController
        .dispose(); // Aquí detenemos y liberamos los recursos del reproductor.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
          child: _videoPlayerController.value.isInitialized
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController)),
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
                              _videoPlayerController.pause();
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
                              _videoPlayerController.play();
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
                              _videoPlayerController.seekTo(Duration(
                                  seconds: _videoPlayerController
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
                              _videoPlayerController.seekTo(Duration(
                                  seconds: _videoPlayerController
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
