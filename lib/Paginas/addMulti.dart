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
        backgroundColor: const Color.fromARGB(255, 85, 145, 214),
        elevation: 10,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Cargar",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            Text(
              " ",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              "Multimedia",
              style: TextStyle(fontSize: 25, color: Colors.white),
            )
          ],
        ),
        actions: const <Widget>[
        ],
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.elliptical(20, 20))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const VideoAudio()));
          },
        ),
      ),
       
       body: Container(
       
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView(children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoInput()));
                },
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.red,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   
                    Icon(Icons.video_camera_front, size: 50,color: Colors.white,),
                    Text("Video",style: TextStyle(fontSize: 30,color: Colors.white),),
                ],),
                ),
              ),
                InkWell(
                  onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AudioInput()));
                },
                  child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green,),
                              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   
                    Icon(Icons.podcasts, size: 50,color: Colors.white,),
                    Text("Podcast",style: TextStyle(fontSize: 30,color: Colors.white),),
                              ],),
                              ),
                ),    
           ],
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 10, crossAxisSpacing: 10),
           ),   
                    
        ),   
      ),







    );
  }
}

void _add() {
  print("Agregar Video u Podcast");
}
