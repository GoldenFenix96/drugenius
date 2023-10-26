// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:card_swiper/card_swiper.dart';
import 'package:drugenius/Componentes/farmaco_picker.dart';
import 'package:drugenius/Componentes/my_checkbpx_general.dart';
import 'package:drugenius/Componentes/my_imagepicker.dart';
import 'package:drugenius/Firebase_Services/firebase_services.dart';
import 'package:drugenius/Paginas/list_medicamentos.dart';
import 'package:flutter/material.dart';
import 'package:drugenius/Componentes/my_textfield_general.dart';
import 'package:drugenius/Componentes/my_formfield_general.dart';

// ignore: must_be_immutable
class EditDrug extends StatefulWidget {
  final String medicamentoId;
  String grupo;
  String subgrupo;
  EditDrug(
      {Key? key,
      required this.medicamentoId,
      required this.grupo,
      required this.subgrupo})
      : super(key: key);

  @override
  _EditDrugState createState() => _EditDrugState();
}

List<File?> imagenes = [];
List<File?> farmacocinetica = [];
List<Map> selectedCuadros = [];

List<String> images = [];
List<List<String>> imagesdelete = [];

List<String> farmaco = [];
List<List<String>> farmacodelete = [];
List<Map> cuadro = [];
List<String> grupof = [];
List<String> subgrupof = [];
final TextEditingController otroNombreController = TextEditingController();
final TextEditingController nombreController = TextEditingController();
final TextEditingController presentacionController = TextEditingController();
final TextEditingController mecanismosController = TextEditingController();
final TextEditingController usoTeraController = TextEditingController();
final TextEditingController efectosController = TextEditingController();
final TextEditingController contraController = TextEditingController();
final TextEditingController posologiaController = TextEditingController();
final TextEditingController cuadroController = TextEditingController();

String nombre = '';
String otro = '';
String contra = '';
String efectos = '';
String posologia = '';
String presentacion = '';
String usoTera = '';
String mecanismos = '';

class _EditDrugState extends State<EditDrug> {
  Firebase_services fs = Firebase_services();
  List<Map<String, dynamic>> medicamento = [];

  @override
  void initState() {
    super.initState();
    // Llama al método para obtener el medicamento que se mostrará
    obtenerGrupos();
    obtenerSubgrupos();
    obtenerMedicamento();
    nombreController.clear();
    otroNombreController.clear();
    nombreController.clear();
    presentacionController.clear();
    mecanismosController.clear();
    usoTeraController.clear();
    efectosController.clear();
    contraController.clear();
    posologiaController.clear();
    imagesdelete.clear();
    farmacodelete.clear();
    checarImagenes(images);
  }

  Future<void> obtenerGrupos() async {
    final gruposObtenidos = await fs.getGrupos();
    if (gruposObtenidos != null) {
      setState(() {
        grupof = gruposObtenidos;
        grupof = grupof.toSet().toList(); // Elimina duplicados
      });
    }
  }

  Future<void> obtenerSubgrupos() async {
    final subgruposObtenidos = await fs.getSubgrupos();
    if (subgruposObtenidos != null) {
      setState(() {
        subgrupof = subgruposObtenidos;
        subgrupof = subgrupof.toSet().toList(); // Elimina duplicados
      });
    }
  }

  Future<void> obtenerMedicamento() async {
    final medicamentoObtenido =
        await fs.obtenerMedicamento(widget.medicamentoId);
    if (medicamentoObtenido != null) {
      setState(() {
        images = medicamentoObtenido['imagenUrls'];
        nombreController.text = medicamentoObtenido['nombre'];
        otroNombreController.text = medicamentoObtenido['otroNombre'];
        contraController.text = medicamentoObtenido['contra'];
        efectosController.text = medicamentoObtenido['efectos'];
        posologiaController.text = medicamentoObtenido['posologia'];
        presentacionController.text = medicamentoObtenido['presentacion'];
        usoTeraController.text = medicamentoObtenido['uso'];
        mecanismosController.text = medicamentoObtenido['mecanismo'];
        farmaco = medicamentoObtenido['farmaUrls'];
        cuadro = medicamentoObtenido['cuadroBasico'];
      });
    }
  }

  List<Map> selectedCuadros = [
    {'name': 'ESTADOS UNIDOS (FDA)', 'isChecked': false},
    {'name': 'ESPAÑA', 'isChecked': false},
    {'name': 'OMS', 'isChecked': false},
    {'name': 'MÉXICO', 'isChecked': true},
  ];

  void validarCheck(List<Map> cuadro) {
    for (int i = 0; i < cuadro.length; i++) {
      final nombre = cuadro[i]['name'];
      final isChecked = cuadro[i]['isChecked'];

      if (isChecked) {
        print("Nombre: $nombre, Estado: isChecked");
      } else {
        print("Nombre: $nombre, Estado: no isChecked");
      }
    }
  }

  void validarImagenes(List<File> imagenes) {
    for (int i = 0; i < imagenes.length; i++) {
      print('Ruta de la imagen $i: ${imagenes[i].path}');
    }
  }

  void checarImagenes(List<String> images) {
    for (int i = 0; i < images.length; i++) {
      print('Ruta de las imagenes obtenidas $i: ${images[i]}');
    }
  }

  void updateImagenes(List<File?> nuevasImagenes) {
    // Actualiza la lista de imágenes en tu frame principal con las nuevas imágenes
    setState(() {
      imagenes = nuevasImagenes;
    });
    // Además, agrega las nuevas imágenes a la lista `images`
    for (final imageFile in nuevasImagenes) {
      if (imageFile != null) {
        images.add(imageFile.path);
      }
    }
  }

  void updateImagenesFarmacocinetica(List<File?> nuevasFarmacocinetica) {
    // Actualiza la lista de imágenes en tu frame principal con las nuevas imágenes
    setState(() {
      farmacocinetica = nuevasFarmacocinetica;
    });
  }

  void validarImagenesFarmacocinetica(List<File> farmacocinetica) {
    for (int i = 0; i < farmacocinetica.length; i++) {
      print('Ruta de la imagen $i: ${farmacocinetica[i].path}');
    }
  }

  void checarImagenesBorrar(List<String> imagesdelete) {
    for (int i = 0; i < imagesdelete.length; i++) {
      print('Ruta de la imagen borrada $i: ${imagesdelete[i]}');
    }
  }

  Future<void> _registrarGrupo(String grupoFar) async {
    await fs.addGrupo(grupoFar);
  }

  Future<void> _registrarSubgrupo(String subgrupoFar) async {
    await fs.addSubgrupo(subgrupoFar);
  }

  Future<void> _actualizarMedicamento() async {
    final nombre = nombreController.text;
    final otroNombre = otroNombreController.text;

    final presentacion = presentacionController.text;
    final mecanismos = mecanismosController.text;
    final uso = usoTeraController.text;
    final efectos = efectosController.text;
    final contraindicaciones = contraController.text;
    final posologia = posologiaController.text;
    validarImagenes(imagenes.whereType<File>().toList());
    validarImagenesFarmacocinetica(farmacocinetica.whereType<File>().toList());
    checarImagenes(images);

    if (nombre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debe ingresar el nombre del medicamentos'),
        ),
      );
    } else {
      if (otroNombre.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Debe ingresar otro nombre para el medicamento'),
          ),
        );
      } else {
        if (presentacion.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Debe ingresar la presentanción de los medicamentos'),
            ),
          );
        } else {
          if (mecanismos.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Debe ingresar los mecanismos de acción'),
              ),
            );
          } else {
            if (uso.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Debe ingresar los usos pedagogicos'),
                ),
              );
            } else {
              if (efectos.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Debe ingresar los efectos adversos'),
                  ),
                );
              } else {
                if (contraindicaciones.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Debe ingresar las contraindicaciones'),
                    ),
                  );
                } else {
                  if (posologia.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Debe ingresar la posología del medicamento'),
                      ),
                    );
                  }
                }
              }
            }
          }
        }
      }
    }

    validarCheck(cuadro);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      // Llama a tu función de actualización
      await fs.updateMedication(
          widget.medicamentoId,
          nombre,
          widget.grupo,
          widget.subgrupo,
          otroNombre,
          presentacion,
          mecanismos,
          uso,
          efectos,
          contraindicaciones,
          posologia,
          cuadro.cast<Map>());

      // Guardar imágenes en Firebase Storage y URLs en Firestore
      if (imagenes.isNotEmpty) {
        for (int i = 0; i < imagenes.length; i++) {
          final imageFile = imagenes[i];
          await fs.uploadImageToStorageAndFirestore(
              widget.medicamentoId, imageFile!);
        }
      }
      if (farmacocinetica.isNotEmpty) {
        for (int i = 0; i < farmacocinetica.length; i++) {
          final imageFile2 = farmacocinetica[i];
          await fs.subirFarmacocinetica(widget.medicamentoId, imageFile2!);
        }
      }

      // Eliminar imágenes en Firebase Storage y Firestore
      if (imagesdelete.isNotEmpty) {
        for (int i = 0; i < imagesdelete.length; i++) {
          final imageUrls = imagesdelete[i];
          print("Enlace a borrar: ${imageUrls[i]}");
          await fs.updateMedicationImages(widget.medicamentoId, imageUrls);
          images.remove(imageUrls[i]); // Elimina la URL de images
        }
      }

      if (farmacodelete.isNotEmpty) {
        for (int i = 0; i < farmacodelete.length; i++) {
          // Imprime la URL en la posición i
          final imageUrls = farmacodelete[i];
          await fs.updateMedicationFarmacocinetica(
              widget.medicamentoId, imageUrls);
          farmaco.remove(imageUrls[i]); // Elimina la URL de images
        }
      }

      // Continúa con cualquier otra lógica o navegación necesaria
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ListMedicamentos(),
        ),
      );
    } catch (e) {
      print('Error al actualizar medicamento: $e');
      // Maneja el error según tus necesidades
    }
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
          "Editar de medicamento",
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
            const SizedBox(height: 15.0),
            Center(
              child: Column(
                children: [
                  Visibility(
                    visible: images
                        .isNotEmpty, // Condición: muestra si images no está vacío
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Imagenes actuales del medicamento',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        const SizedBox(height: 15.0),
                        //TXT DRUG INPUT
                        SizedBox(
                          width: size.width * 1,
                          height: 300,
                          child: Swiper(
                            loop: false,
                            viewportFraction: 0.8,
                            scale: 0.9,
                            itemCount: images.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: double.infinity,
                                height: 300.0,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        images[index],
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
                                            // Almacena la URL de la imagen en imagesdelete
                                            imagesdelete.add([images[index]]);
                                            // Elimina la imagen de la lista
                                            images.removeAt(index);
                                          });
                                        },
                                        child: Container(
                                          // Alto del contenedor del ícono
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromARGB(
                                                255, 170, 45, 36),
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
                            pagination: const SwiperPagination(),
                            control: const SwiperControl(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //FIN TXT DRUG INPUT
                  const SizedBox(height: 25.0),
                  //TXT BIENVENIDA
                  const SizedBox(
                    child: Center(
                      child: Text(
                        "Rellene los siguientes campos con la información del medicamento",
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
                  //TXT INPUT
                  _imagenMedicamento(),
                  const SizedBox(height: 15.0),
                  _grupoFarmacologico(),
                  const SizedBox(height: 15.0),
                  _subgrupoFarmacologico(),
                  const SizedBox(height: 15.0),
                  _nombreMedicamento(),
                  const SizedBox(height: 15.0),
                  _otroNombreMedicamento(),
                  const SizedBox(height: 15.0),
                  _presentacionMedicamento(),
                  const SizedBox(height: 15.0),
                  _mecanismosDeAccion(),
                  const SizedBox(height: 15.0),
                  _usoTerapeutico(),
                  const SizedBox(height: 15.0),
                  _efectosAdversos(),
                  const SizedBox(height: 15.0),
                  _contraIndicacionesMedicamento(),
                  const SizedBox(height: 15.0),
                  _posologiaMedicamento(),
                  const SizedBox(height: 15.0),
                  _cuadroBasico(),
                  const SizedBox(height: 15.0),
                  //_imagenFarmacocinetica(),
                  Visibility(
                    visible: farmaco.isNotEmpty,
                    child: Column(
                      children: <Widget>[
                        const Text(
                          "Farmacocinetica del medicamento",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        SizedBox(
                          width: size.width * 1,
                          height: 300,
                          child: Swiper(
                            loop: false,
                            viewportFraction: 0.8,
                            scale: 0.9,
                            itemCount: farmaco.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: double.infinity,
                                height: 300.0,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        farmaco[index],
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
                                            // Eliminar la imagen de la lista
                                            farmacodelete.add([farmaco[index]]);
                                            farmaco.removeAt(index);
                                            checarImagenes(farmaco);
                                          });
                                        },
                                        child: Container(
                                          // Alto del contenedor del ícono
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromARGB(
                                                255, 170, 45, 36),
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
                            pagination: const SwiperPagination(),
                            control: const SwiperControl(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15.0),
                  _farmacocineticaMedicamento(),
                  //FIN TXT INPUT
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
                          _actualizarMedicamento();
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
                          "Guardar medicamento",
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

  _nombreMedicamento() {
    return myTextFieldGeneral(
        controller: nombreController, labelTxt: nombre, onChanged: (value) {});
  }

  _otroNombreMedicamento() {
    return myTextFieldGeneral(
      controller: otroNombreController,
      labelTxt: "Otro nombre",
      onChanged: (value) {},
    );
  }

  _presentacionMedicamento() {
    return TextFormFieldGeneral(
      controller: presentacionController,
      labelTxt: "Presentación del farmáco",
      onChanged: (value) {},
    );
  }

  _contraIndicacionesMedicamento() {
    return TextFormFieldGeneral(
      controller: contraController,
      labelTxt: "Contraindicaciones",
      onChanged: (value) {},
    );
  }

  _mecanismosDeAccion() {
    return myTextFieldGeneral(
      controller: mecanismosController,
      labelTxt: "Mecanismos de acción",
      onChanged: (value) {},
    );
  }

  _usoTerapeutico() {
    return TextFormFieldGeneral(
      controller: usoTeraController,
      labelTxt: "Uso terapéutico",
      onChanged: (value) {},
    );
  }

  _efectosAdversos() {
    return TextFormFieldGeneral(
      controller: efectosController,
      labelTxt: "Efectos adversos",
      onChanged: (value) {},
    );
  }

  _posologiaMedicamento() {
    return myTextFieldGeneral(
      controller: posologiaController,
      labelTxt: "Posología",
      onChanged: (value) {},
    );
  }

  _cuadroBasico() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          alignment: Alignment.topLeft,
          child: const Text(
            "Cuadro básico",
          ),
        ),
        const SizedBox(height: 10),
        MyCheckBox(
          items: cuadro,
          onCheckBoxChanged: (items) {
            setState(() {
              cuadro = items;
            });
            validarCheck(cuadro);
          },
        ),
      ],
    );
  }

  Widget _grupoFarmacologico() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: Center(
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 204, 204, 204),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                fillColor: Color.fromARGB(255, 204, 204, 204),
                filled: true,
                prefixIcon: Icon(Icons.text_format_outlined),
              ),
              value: widget.grupo, // Establece el valor inicial desde el widget
              items: grupof.map((name) {
                return DropdownMenuItem<String>(
                  value: name,
                  child: Text(name),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  widget.grupo = value!;
                  print("selectedSubGrupo: ${widget.grupo}");
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 15.0),
        Container(
          width: MediaQuery.of(context).size.width * 1,
          height: 55.0,
          margin: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: ElevatedButton(
            onPressed: () {
              _agregarGrupo(context);
            },
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
              "Agregar otro grupo",
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
    );
  }

  Future<void> _agregarGrupo(BuildContext context) async {
    TextEditingController textController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Agregar nuevo grupo"),
          content: TextField(
            controller: textController,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () async {
                String nuevoGrupo = textController.text;
                await _registrarGrupo(nuevoGrupo);

                // Después de agregar el grupo, actualiza la lista de grupos
                await obtenerGrupos();

                Navigator.pop(context, nuevoGrupo);
              },
              child: const Text("Agregar"),
            ),
          ],
        );
      },
    );
  }

  Widget _subgrupoFarmacologico() {
    String selectedValue = widget.subgrupo;

    // O alternativamente, podrías establecerlo en el primer elemento de la lista:
    if (subgrupof.isNotEmpty) {
      selectedValue = subgrupof[0];
      // }
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: Center(
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 204, 204, 204),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                fillColor: Color.fromARGB(255, 204, 204, 204),
                filled: true,
                prefixIcon: Icon(Icons.text_format_outlined),
              ),
              value: selectedValue,
              items: subgrupof.map((name) {
                return DropdownMenuItem<String>(
                  value: name,
                  child: Text(name),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  widget.subgrupo = value ?? "";
                  print(
                      "selectedSubGrupo: ${widget.subgrupo}"); // Asignar una cadena vacía en lugar de null si se selecciona null
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 15.0),
        Container(
          width: MediaQuery.of(context).size.width * 1,
          height: 55.0,
          margin: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: ElevatedButton(
            onPressed: () {
              _agregarSubGrupo(context);
            },
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
              "Agregar otro subgrupo",
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
    );
  }

  Future<void> _agregarSubGrupo(BuildContext context) async {
    TextEditingController textController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Agregar nuevo subgrupo"),
          content: TextField(
            controller: textController,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () async {
                String nuevoSubgrupo = textController.text;
                await _registrarSubgrupo(nuevoSubgrupo);

                // Después de agregar el grupo, actualiza la lista de grupos
                await obtenerSubgrupos();

                Navigator.pop(context, nuevoSubgrupo);
              },
              child: const Text("Agregar"),
            ),
          ],
        );
      },
    );
  }

  _farmacocineticaMedicamento() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          alignment: Alignment.topCenter,
          child: const Text(
            "Insertar nuevas imagenes para la farmacocinética",
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: FarmacocineticaPickerWidget(
              updateFarmaco: updateImagenesFarmacocinetica),
        ),
      ],
    );
  }

  Widget _imagenMedicamento() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          alignment: Alignment.topLeft,
          child: const Text(
            "Inserte nuevas imagenes a cargar del medicamento",
          ),
        ),
        const SizedBox(height: 10),
        Container(
          //margin: const EdgeInsets.symmetric(horizontal: 25.0),
          child: ImagePickerWidget(updateImagenes: updateImagenes),
        ),
      ],
    );
  }
}
