import 'package:drugenius/Paginas/video_audio.dart';
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Cargar",
              style: TextStyle(fontSize: 33, color: Colors.black),
            ),
            Text(
              " ",
              style: TextStyle(fontSize: 33, color: Colors.black),
            ),
            Text(
              "Multimedia",
              style: TextStyle(fontSize: 33, color: Colors.white),
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.login),
            onPressed: _add,
          ),
        ],
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.elliptical(20, 20))),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => VideoAudio()));
          },
        ),
      ),
    );
  }
}

void _add() {
  print("Agregar Video  u Podcast");
}
