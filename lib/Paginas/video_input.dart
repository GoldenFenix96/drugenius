// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:io';

import 'package:drugenius/Componentes/my_imagepicker.dart';
import 'package:drugenius/Componentes/my_textfield_general.dart';
import 'package:drugenius/Componentes/my_videopicker.dart';
import 'package:drugenius/Paginas/nav_videos/videos.dart';
import 'package:flutter/material.dart';
import 'package:drugenius/Firebase_Services/firebase_services.dart';

class VideoInput extends StatefulWidget {
  const VideoInput({super.key});

  @override
  State<VideoInput> createState() => _VideoInputState();
}

List<File?> videos = [];
List<File?> imagenes = [];
List<Map> selectedCuadros = [];

final TextEditingController nombreController = TextEditingController();
Firebase_services fs = Firebase_services();

class _VideoInputState extends State<VideoInput> {
  void setSelectedVideos(List<File?> selectedVideos) {
    setState(() {
      videos = selectedVideos
          .map((video) => video?.path ?? '')
          .cast<File>()
          .toList();
    });
  }

  void validarVideos(List<File> videos) {
    for (int i = 0; i < videos.length; i++) {
      print('Ruta del video $i: ${videos[i].path}');
    }
  }

  void updateVideos(List<File?> nuevosVideos) {
    setState(() {
      videos = nuevosVideos;
    });
  }

  void setSelectedImages(List<File?> selectedImages) {
    setState(() {
      imagenes = selectedImages
          .map((image) => image?.path ?? '')
          .cast<File>()
          .toList();
    });
  }

  void validarImagenes(List<File> imagenes) {
    for (int i = 0; i < imagenes.length; i++) {
      print('Ruta de la imagen $i: ${imagenes[i].path}');
    }
  }

  void updateImagenes(List<File?> nuevasImagenes) {
    // Actualiza la lista de imágenes en tu frame principal con las nuevas imágenes
    setState(() {
      imagenes = nuevasImagenes;
    });
  }

  Future<void> _registrarVideo() async {
    final nombre = nombreController.text;

    print("Salto de linea para los videos XD");
    validarVideos(videos.whereType<File>().toList());
    print("Salto de linea para las miniaturas de los videos XD");
    validarImagenes(imagenes.whereType<File>().toList());
    print('Nombre: $nombre');

    if (nombre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debe ingresar el nombre del Video'),
        ),
      );
      return; // No continuamos si el nombre está vacío
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      // Obtén el contexto antes de entrar al bloque try-catch
      final currentContext = context;

      // Llama a tu función de registro
      final resultadoRegistro = await fs.addTVideo(
        nombre,
      );

      if (resultadoRegistro != null) {
        // Guardar videos en Firebase Storage y URLs en Firestore
        for (int i = 0; i < videos.length; i++) {
          final videoFile = videos[i];
          await fs.uploadVideoToStorageAndFirestore(
              resultadoRegistro, videoFile!);
        }
        for (int i = 0; i < imagenes.length; i++) {
          final imageFile = imagenes[i];
          await fs.uploadImageVideoToStorageAndFirestore(
              resultadoRegistro, imageFile!);
        }

        // Continúa con cualquier otra lógica o navegación necesaria
        Navigator.pop(context);

        // Muestra el mensaje de registro exitoso
        ScaffoldMessenger.of(currentContext).showSnackBar(
          const SnackBar(
            content: Text('Registro exitoso'),
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Videos(),
          ),
        );
      } else {
        // Registro fallido, muestra un mensaje de error
        ScaffoldMessenger.of(currentContext).showSnackBar(
          const SnackBar(
            content: Text('Ha ocurrido un error al registrar el video.'),
          ),
        );
      }
    } catch (e) {
      print('Error al registrar video: $e');
      // Maneja el error según tus necesidades
    }
  }

  @override
  void initState() {
    super.initState();
    // Limpia el controlador de nombre al iniciar la pantalla
    nombreController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          "Ingreso de Videos",
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 22, 112, 177),
        elevation: 0,
      ),
      body: Container(
        //FONDO
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 253, 244),
        ),
        //FIN FONDO
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 25.0),
                  //TXT DRUG INPUT
                  const SizedBox(
                    height: 150,
                    width: 150,
                    child: Center(
                      child: Image(
                        image: AssetImage("assets/images/btn_add.png"),
                      ),
                    ),
                  ),
                  //FIN TXT DRUG INPUT
                  const SizedBox(height: 25.0),
                  //TXT BIENVENIDA
                  const SizedBox(
                    child: Center(
                      child: Text(
                        "Rellene los siguientes campos con la información del video",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          //fontFamily: 'Montserrat',
                          fontSize: 18.0,
                          color: Color(0xffbebcbc),
                        ),
                      ),
                    ),
                  ),
                  //FIN TXT BIENVENIDA
                  const SizedBox(height: 30.0),
                  _videoT(),
                  const SizedBox(height: 15.0),
                  _imagenVideo(),
                  const SizedBox(height: 15.0),
                  _nombreVideo(),
                  const SizedBox(height: 15.0),
                  //BOTON
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                    ),
                    child: SizedBox(
                      width: size.width * 1,
                      height: 55.0,
                      child: ElevatedButton(
                        onPressed: () {
                          _registrarVideo();
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(253, 200, 66, 1),
                          ),
                        ),
                        child: const Text(
                          "Guardar video",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            //fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //FIN BOTON
                  const SizedBox(height: 15.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _nombreVideo() {
    return myTextFieldGeneral(
        controller: nombreController,
        labelTxt: "Nombre del video",
        hintText: "Video 1",
        onChanged: (value) {});
  }

  Widget _videoT() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          alignment: Alignment.topLeft,
          child: const Text(
            "Video",
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: VideoPickerWidget(updateVideos: updateVideos),
        ),
      ],
    );
  }

  Widget _imagenVideo() {
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25.0),
            alignment: Alignment.topLeft,
            child: const Text(
              "Miniatura del video",
            ),
          ),
          const SizedBox(height: 10),
          ImagePickerWidget(updateImagenes: updateImagenes),
        ],
      ),
    );
  }
}
