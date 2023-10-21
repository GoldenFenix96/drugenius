import 'dart:io';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VideoPickerWidget extends StatefulWidget {
  final Function(List<File?>) updateVideos;
  const VideoPickerWidget({Key? key, required this.updateVideos})
      : super(key: key);

  @override
  _VideoPickerWidgetState createState() => _VideoPickerWidgetState();
}

class _VideoPickerWidgetState extends State<VideoPickerWidget> {
  List<File?> _selectedVideo = [];

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

    // Llama a la función para pasar las rutas de las imágenes de vuelta al widget principal
    _setSelectedVideos(selectedVideo);

    widget.updateVideos(selectedVideo);
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
              const Text("No se ha seleccionado ningun video"),
            if (_selectedVideo.isNotEmpty)
              Container(
                width: double.infinity,
                height: 300.0,
                child: Swiper(
                  loop: false,
                  viewportFraction: 0.8,
                  scale: 0.9,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.file(
                        _selectedVideo[index]!,
                        fit: BoxFit.cover,
                      ),
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
                child: const Text(
                  "Video",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    //fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Cambia el radio de la esquina para personalizar la forma
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 240, 240, 240),
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
}
