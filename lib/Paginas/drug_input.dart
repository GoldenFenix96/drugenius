import 'dart:io';

import 'package:drugenius/Componentes/farmaco_picker.dart';
import 'package:drugenius/Componentes/my_checkbpx_general.dart';
import 'package:drugenius/Firebase_Services/firebase_services.dart';
import 'package:drugenius/Paginas/list_medicamentos.dart';
import 'package:flutter/material.dart';
import 'package:drugenius/Componentes/my_imagepicker.dart';
import 'package:drugenius/Componentes/my_textfield_general.dart';
import 'package:drugenius/Componentes/my_formfield_general.dart';
import 'package:drugenius/Componentes/my_dropdown_general.dart';

class DrugInput extends StatefulWidget {
  const DrugInput({Key? key}) : super(key: key);

  @override
  _DrugInputState createState() => _DrugInputState();
}

List<File?> imagenes = [];

List<File?> farmacocinetica = [];

List<Map> selectedCuadros = [];
List<String> grupo = [];
List<String> subgrupo = [];
final TextEditingController otroNombreController = TextEditingController();
final TextEditingController nombreController = TextEditingController();
final TextEditingController presentacionController = TextEditingController();
final TextEditingController mecanismosController = TextEditingController();
final TextEditingController usoTeraController = TextEditingController();
final TextEditingController efectosController = TextEditingController();
final TextEditingController contraController = TextEditingController();
final TextEditingController posologiaController = TextEditingController();
String? selectedGrupo;
String? selectedSubGrupo;
Firebase_services fs = Firebase_services();

class _DrugInputState extends State<DrugInput> {
  @override
  void initState() {
    super.initState();
    // Limpia el controlador de nombre al iniciar la pantalla
    nombreController.clear();
    otroNombreController.clear();
    nombreController.clear();
    presentacionController.clear();
    mecanismosController.clear();
    usoTeraController.clear();
    efectosController.clear();
    contraController.clear();
    posologiaController.clear();
    obtenerGrupos();
    obtenerSubgrupos();
  }

  Future<void> obtenerGrupos() async {
    final gruposObtenidos = await fs.getGrupos();
    if (gruposObtenidos != null) {
      setState(() {
        grupo = gruposObtenidos;
      });
    }
  }

  Future<void> obtenerSubgrupos() async {
    final subgruposObtenidos = await fs.getSubgrupos();
    if (subgruposObtenidos != null) {
      setState(() {
        subgrupo = subgruposObtenidos;
      });
    }
  }

  void setSelectedImages(List<File?> selectedImages) {
    setState(() {
      imagenes = selectedImages
          .map((image) => image?.path ?? '')
          .cast<File>()
          .toList();
    });
  }

  void setSelectedImages2(List<File?> selectedImages2) {
    setState(() {
      farmacocinetica = selectedImages2
          .map((image) => image?.path ?? '')
          .cast<File>()
          .toList();
    });
  }

  List<Map> selectedCuadros = [
    {'name': 'ESTADOS UNIDOS (FDA)', 'isChecked': false},
    {'name': 'ESPAÑA', 'isChecked': false},
    {'name': 'OMS', 'isChecked': false},
    {'name': 'MÉXICO', 'isChecked': true},
  ];

  void validarCheck(List<Map> selectedCuadros) {
    for (int i = 0; i < selectedCuadros.length; i++) {
      final nombre = selectedCuadros[i]['name'];
      final isChecked = selectedCuadros[i]['isChecked'];

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

  void updateImagenes(List<File?> nuevasImagenes) {
    // Actualiza la lista de imágenes en tu frame principal con las nuevas imágenes
    setState(() {
      imagenes = nuevasImagenes;
    });
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

  Future<void> _registrarGrupo(String grupoFar) async {
    await fs.addGrupo(grupoFar);
  }

  Future<void> _registrarSubgrupo(String subgrupoFar) async {
    await fs.addSubgrupo(subgrupoFar);
  }

  Future<void> _registrarMedicamento() async {
    final nombre = nombreController.text;
    final otroNombre = otroNombreController.text;

    final presentacion = presentacionController.text;
    final mecanismos = mecanismosController.text;
    final uso = usoTeraController.text;
    final efectos = efectosController.text;
    final contraindicaciones = contraController.text;
    final posologia = posologiaController.text;
    print("Salto de linea para las imagenes de los medicamentos XD");
    validarImagenes(imagenes.whereType<File>().toList());
    print("Salto de linea para las farmacocinetica XD");
    validarImagenesFarmacocinetica(farmacocinetica.whereType<File>().toList());

    print('Nombre: $nombre');
    print('Otro Nombre: $otroNombre');
    print('Grupo: $selectedGrupo');
    print('Sub grupo: $selectedSubGrupo');
    print('Presentacion: $presentacion');
    print('Mecanismos de Acción: $mecanismos');
    print('Uso pedagogico: $uso');
    print('Efectos Adversos: $efectos');
    print('Contraindicaciones: $contraindicaciones');
    print('Posología: $posologia');

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

    validarCheck(selectedCuadros);
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
      final resultadoRegistro = await fs.addMedication(
          nombre,
          selectedGrupo!,
          selectedSubGrupo!,
          otroNombre,
          presentacion,
          mecanismos,
          uso,
          efectos,
          contraindicaciones,
          posologia,
          selectedCuadros.cast<Map>());

      if (resultadoRegistro != null) {
        // Guardar imágenes en Firebase Storage y URLs en Firestore
        for (int i = 0; i < imagenes.length; i++) {
          final imageFile = imagenes[i];
          await fs.uploadImageToStorageAndFirestore(
              resultadoRegistro, imageFile!);
        }

        for (int i = 0; i < farmacocinetica.length; i++) {
          final imageFile2 = farmacocinetica[i];
          await fs.subirFarmacocinetica(resultadoRegistro, imageFile2!);
        }

        // Continúa con cualquier otra lógica o navegación necesaria
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ListMedicamentos(),
          ),
        );
      } else {
        // Registro fallido, muestra un mensaje de error
        ScaffoldMessenger.of(currentContext).showSnackBar(
          const SnackBar(
            content: Text('Ha ocurrido un error al registrar el medicamento.'),
          ),
        );
      }
    } catch (e) {
      print('Error al registrar medicamento: $e');
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
          "Ingreso de medicamentos",
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
                  _grupoMedicamento(),
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
                          _registrarMedicamento();
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
        controller: nombreController,
        labelTxt: "Nombre del medicamento",
        hintText: "Paracetamol",
        onChanged: (value) {});
  }

  _mecanismosDeAccion() {
    return myTextFieldGeneral(
      controller: mecanismosController,
      labelTxt: "Mecanismos de acción",
      hintText: "Inhibición de enzimas",
      onChanged: (value) {},
    );
  }

  _usoTerapeutico() {
    return TextFormFieldGeneral(
      controller: usoTeraController,
      labelTxt: "Uso terapéutico",
      hintText: "Ejemplo...",
      onChanged: (value) {},
    );
  }

  _efectosAdversos() {
    return TextFormFieldGeneral(
      controller: efectosController,
      labelTxt: "Efectos adversos",
      hintText: "Ejemplo...",
      onChanged: (value) {},
    );
  }

  _posologiaMedicamento() {
    return TextFormFieldGeneral(
      controller: posologiaController,
      labelTxt: "Posología",
      hintText:
          "Dosis: Tomar 1 comprimido de 400 mg.\nFrecuencia: Tomar cada 6 horas según sea necesario para el dolor o la fiebre. No tomar más de 4 comprimidos (1600 mg) en un período de 24 horas.\nDuración: No tomar durante más de 7 días sin consultar a un médico.",
      onChanged: (value) {},
    );
  }

  _farmacocineticaMedicamento() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            alignment: Alignment.topLeft,
            child: const Text(
              "Farmacocinética",
            ),
          ),
          const SizedBox(height: 10),
          Container(
            child: Container(
              //margin: const EdgeInsets.symmetric(horizontal: 25.0),
              child: FarmacocineticaPickerWidget(
                  updateFarmaco: updateImagenesFarmacocinetica),
            ),
          ),
        ],
      ),
    );
  }

  _cuadroBasico() {
    return Container(
      child: Column(
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
          Container(
            child: MyCheckBox(
              items: selectedCuadros,
              onCheckBoxChanged: (items) {
                setState(() {
                  selectedCuadros = items;
                });
                validarCheck(selectedCuadros);
              },
            ),
          ),
        ],
      ),
    );
  }

  _grupoMedicamento() {
    return Column(
      children: [
        MyDropDown(
          list: grupo,
          hintText: "Seleccione un grupo",
          value: "",
          onChanged: (value) {
            // Actualiza el valor seleccionado en la variable 'selectedGrupo'
            setState(() {
              selectedGrupo = value;
              print("selectedGrupo: $selectedGrupo");
            });
          },
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

  _subgrupoFarmacologico() {
    return Column(
      children: [
        MyDropDown(
          list: subgrupo,
          hintText: "Seleccione un subgrupo",
          value: "",
          onChanged: (value) {
            // Actualiza el valor seleccionado en la variable 'selectedGrupo'
            setState(() {
              selectedSubGrupo = value;
              print("selectedSubGrupo: $selectedSubGrupo");
            });
          },
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

  _otroNombreMedicamento() {
    return myTextFieldGeneral(
      controller: otroNombreController,
      labelTxt: "Otro nombre",
      hintText: "Aspirina",
      onChanged: (value) {},
    );
  }

  _presentacionMedicamento() {
    return TextFormFieldGeneral(
      controller: presentacionController,
      labelTxt: "Presentación del farmáco",
      hintText: "Tableta  (500mg). Tableta soluble o efervescente (300mg)...",
      onChanged: (value) {},
    );
  }

  _contraIndicacionesMedicamento() {
    return TextFormFieldGeneral(
      controller: contraController,
      labelTxt: "Contraindicaciones",
      hintText:
          "Hipersensibilidad al fármaco, úlcera péptica o gastritis activas, hipoprotrombinemia, niños menores de 6 años....",
      onChanged: (value) {},
    );
  }

  Widget _imagenMedicamento() {
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25.0),
            alignment: Alignment.topLeft,
            child: const Text(
              "Imágen del medicamento",
            ),
          ),
          const SizedBox(height: 10),
          Container(
            child: Container(
              //margin: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ImagePickerWidget(updateImagenes: updateImagenes),
            ),
          ),
        ],
      ),
    );
  }
  // Resto de tu código de funciones _grupoMedicamento(), _subgrupoFarmacologico(), etc.
}
