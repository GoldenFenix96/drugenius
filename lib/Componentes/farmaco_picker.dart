import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FarmacocineticaPickerWidget extends StatefulWidget {
  final Function(List<File?>) updateFarmaco;
  const FarmacocineticaPickerWidget({Key? key, required this.updateFarmaco})
      : super(key: key);

  @override
  State<FarmacocineticaPickerWidget> createState() =>
      _FarmacocineticaPickerWidgetState();
}

class _FarmacocineticaPickerWidgetState
    extends State<FarmacocineticaPickerWidget> {
  List<File?> _selectedImages2 = [];
  int currentIndex = 0;

  void _setSelectedImages(List<File?> selectedImages2) {
    setState(() {
      _selectedImages2 = selectedImages2;
    });
  }

  Future<void> _pickImageFromGallery() async {
    final returnedImage2 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage2 == null) return;

    final List<File?> selectedImages2 = List.from(_selectedImages2);

    selectedImages2.add(File(returnedImage2.path));

    widget.updateFarmaco(selectedImages2);

    // Llama a la función para pasar las rutas de las imágenes de vuelta al widget principal
    _setSelectedImages(selectedImages2);

    widget.updateFarmaco(selectedImages2);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          if (_selectedImages2.isEmpty)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25.0),
              child: const Text(
                  "No se ha seleccionado ninguna imagen de farmacocinética"),
            ),
          if (_selectedImages2.isNotEmpty)
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
                            _selectedImages2[index]!,
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
                                _selectedImages2.removeAt(index);
                              });
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
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
                itemCount: _selectedImages2.length,
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
                "Agregar imagen de farmacocinética",
                textAlign: TextAlign.center,
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
