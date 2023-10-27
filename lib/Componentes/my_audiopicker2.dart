import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AudioPickerWidget2 extends StatefulWidget {
  final Function(List<File?>) updateAudios;

  const AudioPickerWidget2({Key? key, required this.updateAudios})
      : super(key: key);

  @override
  State<AudioPickerWidget2> createState() => _AudioPickerWidgetState2();
}

class _AudioPickerWidgetState2 extends State<AudioPickerWidget2> {
  List<File?> _selectedAudio = [];
  AudioPlayer audioPlayer = AudioPlayer();

  void _setSelectedAudios(List<File?> selectedAudios) {
    setState(() {
      _selectedAudio = selectedAudios;
    });
  }

  Future<void> _playAudio(File? audioFile) async {
    if (audioFile != null && await audioFile.exists()) {
      await audioPlayer.play(audioFile.path as Source);
    }
  }

  Future<void> _pickAudioFromGallery() async {
    final returnedAudio =
        await FilePicker.platform.pickFiles(type: FileType.audio);
    if (returnedAudio == null) return;

    final List<File?> selectedAudio = List.from(_selectedAudio);
    selectedAudio.add(File(returnedAudio.files.single.path!));

    widget.updateAudios(selectedAudio);
    _setSelectedAudios(selectedAudio);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          if (_selectedAudio.isEmpty)
            const Text("No has seleccionado algun audio"),
          if (_selectedAudio.isNotEmpty)
            SizedBox(
              // Set a maximum height for the ListView
              height:
                  size.height * 0.1, // Use 30% of screen height as an example
              child: ListView.builder(
                itemCount: _selectedAudio.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(_selectedAudio[index]!
                      .path
                      .split('/')
                      .last), // Display audio filename
                  // Add an icon or a widget to play the audio
                  trailing: const Icon(Icons.play_arrow),
                  onTap: () {
                    _playAudio(_selectedAudio[index]);
                  },
                ),
              ),
            ),
          const SizedBox(height: 15.0),
          SizedBox(
            width: size.width * 1,
            height: 55.0,
            child: ElevatedButton(
              onPressed: () => _pickAudioFromGallery(),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 240, 240, 240),
                ),
              ),
              child: const Text(
                "Audio",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

/*
ListView.builder(
              itemCount: _selectedAudio.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_selectedAudio[index]!
                    .path
                    .split('/')
                    .last), // Display audio filename
                // Add an icon or a widget to play the audio
                trailing: const Icon(Icons.play_arrow),
                onTap: () {
                  _playAudio(_selectedAudio[index]);
                },
              ),
            ),
*/
