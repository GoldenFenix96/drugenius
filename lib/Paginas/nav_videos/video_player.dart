import 'package:drugenius/Paginas/nav_videos/videos.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState(){
    super.initState();
     _videoPlayerController = VideoPlayerController.asset('assets/video/Video2.mp4')..initialize().then((_) {
      _videoPlayerController.play();
      setState(() {});
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
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
          ],
        ),
        actions: <Widget>[
        //IconButton(
        //    icon: Icon(Icons.arrow_right),
        //    onPressed: () {
        //      Navigator.push(
        //          context, MaterialPageRoute(builder: (context) => VideoPlayerWidget2()));
        //    },
        //  ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            _videoPlayerController.dispose();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Videos()));
          },
        ),
      ),

      body: Center(
          child: _videoPlayerController.value.isInitialized ? 
          Column(
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
              backgroundColor: MaterialStateProperty.all< Color > (Colors.red),
              fixedSize: MaterialStateProperty.all< Size >(const Size(70, 70)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100))
               )
              ),
              onPressed: (){
              _videoPlayerController.pause();
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
              _videoPlayerController.play();
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
              _videoPlayerController.seekTo(
                  Duration(
                  seconds: _videoPlayerController.value.position.inSeconds + 2
                )
              );
             }, 
             child: const Icon(Icons.fast_forward)
             ),
           ],
          )
 
          ],
         )   : Container(
           
         ),

      )
    );
  }
}

