import 'dart:io';
import 'package:card_swiper/card_swiper.dart';
import 'package:drugenius/Componentes/farmaco_picker.dart';
import 'package:drugenius/Componentes/my_checkbpx_general.dart';
import 'package:drugenius/Firebase_Services/firebase_services.dart';
import 'package:drugenius/Paginas/list_medicamentos.dart';
import 'package:flutter/material.dart';
import 'package:drugenius/Componentes/my_imagepicker.dart';
import 'package:drugenius/Componentes/my_textfield_general.dart';
import 'package:drugenius/Componentes/my_formfield_general.dart';

class EditDrug extends StatefulWidget {
  final String medicamentoId;
  final String grupo;
  final String subgrupo;
  const EditDrug(
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
List<String> farmaco = [];
List<Map> cuadro = [];

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

String? selectedGrupo;
String? selectedSubGrupo;

class _EditDrugState extends State<EditDrug> {
  Firebase_services fs = Firebase_services();
  List<Map<String, dynamic>> medicamento = [];

  @override
  void initState() {
    super.initState();
    // Llama al método para obtener el medicamento que se mostrará
    obtenerMedicamento();
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
          "Editar de medicamento",
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 85, 145, 214),
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

  _farmacocineticaMedicamento() {
    return Column(
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
          margin: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: FarmacocineticaPickerWidget(
              updateFarmaco: updateImagenesFarmacocinetica),
        ),
      ],
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

  List<String> grupof = ['AINES'];

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
                  selectedGrupo = value;
                  print("subgrupo seleccionado: $selectedGrupo");
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

  _agregarGrupo(BuildContext context) async {
    String nuevoGrupo = await showDialog(
      context: context,
      builder: (BuildContext context) {
        String nuevoGrupo = ''; // Inicializar con una cadena vacía
        return AlertDialog(
          title: const Text("Agregar nuevo grupo"),
          content: TextField(
            onChanged: (value) {
              nuevoGrupo = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context,
                    ''); // Usar una cadena vacía en caso de cancelación
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, nuevoGrupo);
              },
              child: const Text("Agregar"),
            ),
          ],
        );
      },
    );

    if (nuevoGrupo.isNotEmpty) {
      setState(() {
        grupof.add(nuevoGrupo);
      });
    }
  }

  List<String> subgrup = [
    'SALICILATOS',
    'DERIV DEL ÁCIDO ACÉTICO',
    'PARAAMINOFEROL',
    'DERIV DEL ÁCIDO PROPIÓNICO'
  ];

  Widget _subgrupoFarmacologico() {
    print("Subgrupo de medicamentos: ${widget.subgrupo}");

    // Agregar widget.subgrupo a la lista subgrup si no está presente
    return Container(
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
          value: widget.subgrupo,
          items: subgrup.map((name) {
            return DropdownMenuItem<String>(
              value: name,
              child: Text(name),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              selectedSubGrupo = value;
              print("subgrupo seleccionado: $selectedSubGrupo");
            });
          },
        ),
      ),
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
            "Imágenes del medicamento",
          ),
        ),
        const SizedBox(height: 10),
        // Swiper to show the images from URLs
        Container(
          height: 300, // Set the desired height
          child: Swiper(
            loop: false,
            viewportFraction: 0.8,
            scale: 0.9,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.network(
                images[index],
                fit: BoxFit.cover,
              );
            },
            pagination: const SwiperPagination(),
            control: const SwiperControl(), // Optional: add controls
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: ImagePickerWidget(updateImagenes: updateImagenes),
        ),
      ],
    );
  }
}
