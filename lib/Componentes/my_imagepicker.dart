// ignore_for_file: sort_child_properties_last
import 'dart:io';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(List<File?>) updateImagenes;
  const ImagePickerWidget({Key? key, required this.updateImagenes})
      : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  List<File?> _selectedImage = [];
  int currentIndex = 0;

  void _setSelectedImages(List<File?> selectedImages) {
    setState(() {
      _selectedImage = selectedImages;
    });
  }

  Future<void> _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;

    final List<File?> selectedImages = List.from(_selectedImage);
    selectedImages.add(File(returnedImage.path));

    widget.updateImagenes(selectedImages);

    // Llama a la función para pasar las rutas de las imágenes de vuelta al widget principal
    _setSelectedImages(selectedImages);

    widget.updateImagenes(selectedImages);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          if (_selectedImage.isEmpty)
            const Text("No se ha seleccionado ninguna imágen"),
          if (_selectedImage.isNotEmpty)
            SizedBox(
              width: double.infinity,
              height: 300.0,
              child: Swiper(
                loop: false,
                viewportFraction: 0.8,
                scale: 0.9,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: double.infinity,
                    height: 300.0,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.file(
                            _selectedImage[index]!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedImage.removeAt(index);
                              });
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 170, 45, 36),
                              ),
                              child: const Icon(
                                Icons.clear,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onIndexChanged: (index) {
                  currentIndex = index;
                },
                itemCount: _selectedImage.length,
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
              ),
            ),
          const SizedBox(height: 15.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25.0),
            width: size.width * 1,
            height: 55.0,
            child: ElevatedButton(
              onPressed: () => _pickImageFromGallery(),
              child: const Text(
                "Agregar imágen",
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
    );
  }
}
