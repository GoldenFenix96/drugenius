import 'dart:io';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoPickerWidget extends StatefulWidget {
  final Function(List<File?>) updateVideos;

  const VideoPickerWidget({Key? key, required this.updateVideos})
      : super(key: key);

  @override
  _VideoPickerWidgetState createState() => _VideoPickerWidgetState();
}

class _VideoPickerWidgetState extends State<VideoPickerWidget> {
  List<File?> _selectedVideo = [];
  VideoPlayerController? _videoController;

  void _setSelectedVideos(List<File?> selectedVideos) {
    setState(() {
      _selectedVideo = selectedVideos;
    });
  }

  Future<void> _pickVideoFromGallery() async {
    final returnedVideo =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (returnedVideo == null) return;

    final List<File?> selectedVideo = List.from(_selectedVideo);
    selectedVideo.add(File(returnedVideo.path));

    widget.updateVideos(selectedVideo);
    _setSelectedVideos(selectedVideo);

    // Inicializa el controlador de video
    if (_selectedVideo.isNotEmpty) {
      _videoController = VideoPlayerController.file(_selectedVideo[0]!);
      _videoController!.initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            if (_selectedVideo.isEmpty)
              const Text("No se ha seleccionado ningún video"),
            if (_selectedVideo.isNotEmpty)
              SizedBox(
                width: double.infinity,
                height: 300.0,
                child: Swiper(
                  loop: false,
                  viewportFraction: 0.8,
                  scale: 0.9,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: VideoPlayer(_videoController!), // Muestra el video
                    );
                  },
                  itemCount: _selectedVideo.length,
                  pagination: const SwiperPagination(),
                  control: const SwiperControl(),
                ),
              ),
            const SizedBox(height: 15.0),
            SizedBox(
              width: size.width * 1,
              height: 55.0,
              child: ElevatedButton(
                onPressed: () => _pickVideoFromGallery(),
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
                  "Video",
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
      ),
    );
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }
}
