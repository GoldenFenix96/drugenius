import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FarmacocineticaPickerWidget extends StatefulWidget {
  const FarmacocineticaPickerWidget({Key? key}) : super(key: key);

  @override
  _FarmacocineticaPickerWidgetState createState() =>
      _FarmacocineticaPickerWidgetState();
}

class _FarmacocineticaPickerWidgetState
    extends State<FarmacocineticaPickerWidget> {
  List<File?> _selectedImages = [];

  void _setSelectedImages(List<File?> selectedImages) {
    setState(() {
      _selectedImages = selectedImages;
    });
  }

  Future<void> _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;

    final List<File?> selectedImages = List.from(_selectedImages);
    selectedImages.add(File(returnedImage.path));

    // Llama a la función para pasar las rutas de las imágenes de vuelta al widget principal
    _setSelectedImages(selectedImages);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            if (_selectedImages.isEmpty)
              const Text(
                  "No se ha seleccionado ninguna imagen de farmacocinética"),
            if (_selectedImages.isNotEmpty)
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
                        _selectedImages[index]!,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  itemCount: _selectedImages.length,
                  pagination: const SwiperPagination(),
                  control: const SwiperControl(),
                ),
              ),
            const SizedBox(height: 15.0),
            SizedBox(
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
}
