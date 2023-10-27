import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:audioplayers/audioplayers.dart'; // Importa esto

class AudioPickerWidget extends StatefulWidget {
  final Function(List<File?>) updateAudios;
  const AudioPickerWidget({Key? key, required this.updateAudios})
      : super(key: key);

  @override
  State<AudioPickerWidget> createState() => _AudioPickerWidgetState();
}

class _AudioPickerWidgetState extends State<AudioPickerWidget> {
  List<File?> _selectedAudios = [];
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _setSelectedAudios(List<File?> selectedAudios) {
    setState(() {
      _selectedAudios = selectedAudios;
    });
  }

  Future<void> _playAudio(File? audioFile) async {
    if (audioFile != null && await audioFile.exists()) {
      await _audioPlayer.play(audioFile.path as Source);
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _pickAudioFromStorage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: true,
    );

    if (result == null) return;

    final selectedAudios =
        List<File?>.from(result.files.map((file) => File(file.path!)));

    widget.updateAudios(selectedAudios);
    _setSelectedAudios(selectedAudios);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          if (_selectedAudios.isEmpty)
            const Text("No se ha seleccionado ningún audio"),
          if (_selectedAudios.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _selectedAudios.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Audio ${index + 1}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.clear, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          _selectedAudios.removeAt(index);
                        });
                      },
                    ),
                    onTap: () async {
                      _playAudio(_selectedAudios[index]);
                    },
                  );
                },
              ),
            ),
          const SizedBox(height: 15.0),
          ElevatedButton(
            onPressed: () => _pickAudioFromStorage(),
            child: const Text(
              "Agregar audio",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
