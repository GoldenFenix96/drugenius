// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  List<File?> _selectedImage = [];

  Future<void> _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage.add(File(returnedImage.path));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            if (_selectedImage.isEmpty)
              const Text("No se ha seleccionado ninguna imagen"),
            if (_selectedImage.isNotEmpty)
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
                        _selectedImage[index]!,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  itemCount: _selectedImage.length,
                  pagination: SwiperPagination(),
                  control: SwiperControl(),
                ),
              ),
            SizedBox(height: 15.0),
            SizedBox(
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
                    Color.fromARGB(255, 240, 240, 240),
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
