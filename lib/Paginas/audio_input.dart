import 'dart:io';

import 'package:drugenius/Componentes/my_audiopicker.dart';
import 'package:drugenius/Componentes/my_textfield_general.dart';
import 'package:drugenius/Paginas/addMulti.dart';
import 'package:flutter/material.dart';
import 'package:drugenius/Firebase_Services/firebase_services.dart';

class AudioInput extends StatefulWidget {
  const AudioInput({super.key});

  @override
  State<AudioInput> createState() => _AudioInputState();
}

List<File?> audios = [];

List<Map> selectedCuadros = [];

final TextEditingController nombreController = TextEditingController();
final TextEditingController creadorController = TextEditingController();
Firebase_services fs = Firebase_services();

class _AudioInputState extends State<AudioInput> {
  void setSelectedVideos(List<File?> selectedAudios) {
    setState(() {
      audios = selectedAudios
          .map((audio) => audio?.path ?? '')
          .cast<File>()
          .toList();
    });
  }

  void validarAudio(List<File> audios) {
    for (int i = 0; i < audios.length; i++) {
      print('Ruta del audio $i: ${audios[i].path}');
    }
  }

  void updateAudios(List<File?> nuevosAudios) {
    setState(() {
      audios = nuevosAudios;
    });
  }

  Future<void> _registrarAudio() async {
  final nombre = nombreController.text;
  final creador = creadorController.text;

  print("Salto de linea para los audios");
  validarAudio(audios.whereType<File>().toList());
  print('Nombre: $nombre');
  print('Creador: $creador');

  if (nombre.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Debe ingresar el nombre del Podcast'),
      ),
    );
    return; // No continuamos si el nombre está vacío
  }

  if (creador.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Debe ingresar el creador del Podcast'),
      ),
    );
    return; // No continuamos si el creador está vacío
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
    final resultadoRegistro = await fs.addTAudio(
      nombre,
      creador,
    );

    if (resultadoRegistro != null) {
      // Guardar audios en Firebase Storage y URLs en Firestore
      for (int i = 0; i < audios.length; i++) {
        final audioFile = audios[i];
        await fs.uploadAudioToStorageAndFirestore(
            resultadoRegistro, audioFile!);
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
          builder: (context) => const AddMulti(),
        ),
      );
    } else {
      // Registro fallido, muestra un mensaje de error
      ScaffoldMessenger.of(currentContext).showSnackBar(
        const SnackBar(
          content: Text('Ha ocurrido un error al registrar el audio.'),
        ),
      );
    }
  } catch (e) {
    print('Error al registrar Audio: $e');
    // Maneja el error según tus necesidades
  }
}

  @override
  void initState() {
    super.initState();
    // Limpia el controlador de nombre al iniciar la pantalla
    nombreController.clear();
    creadorController.clear();
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
          "Ingreso de Audios",
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
                        "Rellene los siguientes campos con la información del audio",
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
                  _audioT(),
                  const SizedBox(height: 15.0),
                  _nombreAudio(),
                  const SizedBox(height: 15.0),
                  _creadorAudio(),
                  const SizedBox(height: 30.0),
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
                          _registrarAudio();
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
                          "Guardar audio",
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

  _nombreAudio() {
    return myTextFieldGeneral(
        controller: nombreController,
        labelTxt: "Nombre del audio",
        hintText: "Audio 1",
        onChanged: (value) {});
  }

  _creadorAudio() {
    return myTextFieldGeneral(
        controller: creadorController,
        labelTxt: "Nombre del creador del audio",
        hintText: "Drugenius",
        onChanged: (value) {});
  }

  Widget _audioT() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            alignment: Alignment.topLeft,
            child: const Text(
              "Audio",
            ),
          ),
          const SizedBox(height: 10),
          Container(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: AudioPickerWidget(updateAudios: updateAudios),
            ),
          ),
        ],
      ),
    );
  }
}

/*
Future<void> _registrarAudio() async {
    final nombre = nombreController.text;
    final creador = creadorController.text;

    print("Salto de linea para los audios");
    validarAudio(audios.whereType<File>().toList());
    print('Nombre: $nombre');
    print('Creador: $creador');

    if (nombre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debe ingresar el nombre del Podcast'),
        ),
      );
    }

    if (creador.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debe ingresar el creador del Podcast'),
        ),
      );
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
      final resultadoRegistro = await fs.addTAudio(
        nombre,
        creador,
      );

      if (resultadoRegistro != null) {
        // Guardar audios en Firebase Storage y URLs en Firestore
        for (int i = 0; i < audios.length; i++) {
          final audioFile = audios[i];
          await fs.uploadAudioToStorageAndFirestore(
              resultadoRegistro, audioFile!);
        }

        // Continúa con cualquier otra lógica o navegación necesaria
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Audios(),
          ),
        );
      } else {
        // Registro fallido, muestra un mensaje de error
        ScaffoldMessenger.of(currentContext).showSnackBar(
          const SnackBar(
            content: Text('Ha ocurrido un error al registrar el audio.'),
          ),
        );
      }
    } catch (e) {
      print('Error al registrar Audio: $e');
      // Maneja el error según tus necesidades
    }
  }
*/
