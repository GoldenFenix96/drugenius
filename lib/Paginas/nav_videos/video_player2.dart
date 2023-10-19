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
  late  VideoPlayerController _videoPlayerController2;

  @override
  void initState(){
    super.initState();

     _videoPlayerController2 = VideoPlayerController.asset('assets/video/Video1.mp4')..initialize().then((_) {
      _videoPlayerController2.play();
      setState(() {
        
      });
     });
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
       backgroundColor: Color.fromARGB(255, 85, 145, 214),
        elevation: 10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Reproductor",
              style: TextStyle(fontSize: 35, color: Colors.black),
            ),
          ],
        ),
        actions: <Widget>[
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Videos()));
          },
        ),
      ),

      body: Center(
          child: _videoPlayerController2.value.isInitialized ? 
          Column(
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
              backgroundColor: MaterialStateProperty.all< Color > (Colors.red),
              fixedSize: MaterialStateProperty.all< Size >(const Size(70, 70)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100))
               )
              ),
              onPressed: (){
              _videoPlayerController2.pause();
             }, 
             child: const Icon(Icons.pause)
             ),
            
            const Padding(padding: EdgeInsets.all(2)),

             ElevatedButton(
               style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all< Color > (Colors.green),
              fixedSize: MaterialStateProperty.all< Size >(const Size(70, 70)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100))
               )
              ),
              
              onPressed: (){
              _videoPlayerController2.play();
             }, 
             child: const Icon(Icons.play_arrow)
             ),

             const Padding(padding: EdgeInsets.all(2)),

              ElevatedButton(
              style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all< Color > (Colors.yellowAccent),
              fixedSize: MaterialStateProperty.all< Size >(const Size(70, 70)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100))
               )
              ),
              onPressed: () {
              _videoPlayerController2.seekTo(
                  Duration(
                  seconds: _videoPlayerController2.value.position.inSeconds + 1
                )
              );
             }, 
             child: const Icon(Icons.replay_outlined)
             ),

          ],)

            ],
         )   : Container(),

      )
    );
  }
}