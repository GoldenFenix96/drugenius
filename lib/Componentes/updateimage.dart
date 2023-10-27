// ignore_for_file: sort_child_properties_last
import 'dart:io';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateImagePickerWidget extends StatefulWidget {
  final Function(List<File?>) updateImagenes;
  final List<File?> initialImages;

  const UpdateImagePickerWidget({
    Key? key,
    required this.updateImagenes,
    required this.initialImages,
  }) : super(key: key);

  @override
  State<UpdateImagePickerWidget> createState() =>
      _UpdateImagePickerWidgetState();
}

class _UpdateImagePickerWidgetState extends State<UpdateImagePickerWidget> {
  // ignore: prefer_final_fields
  List<File?> _selectedImages = [];

  @override
  void initState() {
    super.initState();
    _selectedImages.addAll(widget.initialImages);
  }

  void _addImages(List<File?> newImages) {
    setState(() {
      _selectedImages.addAll(newImages);
    });
  }

  void _removeImage(int index) {
    setState(() {
      if (index >= 0 && index < _selectedImages.length) {
        _selectedImages.removeAt(index);
      }
    });
  }

  void _updateImages() {
    widget.updateImagenes(_selectedImages);
  }

  Future<void> _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;

    final List<File?> selectedImages = List.from(_selectedImages);
    selectedImages.add(File(returnedImage.path));

    _addImages(selectedImages);
    _updateImages();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          if (_selectedImages.isEmpty)
            const Text("No se ha seleccionado ninguna imagen"),
          if (_selectedImages.isNotEmpty)
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
                            _selectedImages[index]!,
                            width: 300,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              _removeImage(index);
                              _updateImages();
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
              child: const Text(
                "Agregar imagen",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
