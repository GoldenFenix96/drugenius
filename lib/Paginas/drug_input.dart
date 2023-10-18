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

List<File> imagenes = [];

List<File> farmacocinetica = [];

List<Map> selectedCuadros = [];
final TextEditingController otroNombreController = TextEditingController();
final TextEditingController nombreController = TextEditingController();
final TextEditingController presentacionController = TextEditingController();
final TextEditingController mecanismosController = TextEditingController();
final TextEditingController usoTeraController = TextEditingController();
final TextEditingController efectosController = TextEditingController();
final TextEditingController contraController = TextEditingController();
final TextEditingController posologiaController = TextEditingController();
final TextEditingController cuadroController = TextEditingController();
String? selectedGrupo;
String? selectedSubGrupo;
Firebase_services fs = Firebase_services();

class _DrugInputState extends State<DrugInput> {
  void setSelectedImages(List<File?> selectedImages) {
    setState(() {
      imagenes = selectedImages
          .map((image) => image?.path ?? '')
          .cast<File>()
          .toList();
    });
  }

  void setSelectedImages2(List<File?> selectedImages) {
    setState(() {
      farmacocinetica = selectedImages
          .map((image) => image?.path ?? '')
          .cast<File>()
          .toList();
    });
  }

  void validarCheck(List<Map> selectedCuadros) {
    for (int i = 0; i < selectedCuadros.length; i++) {
      if (selectedCuadros[i]['isChecked']) {
        print("Name: ${selectedCuadros[i]['name']}");
      }
    }
  }

  Future<bool> _registrarMedicamento() async {
    final nombre = nombreController.text;
    final otroNombre = otroNombreController.text;

    final presentacion = presentacionController.text;
    final mecanismos = mecanismosController.text;
    final uso = usoTeraController.text;
    final efectos = efectosController.text;
    final contraindicaciones = contraController.text;
    final posologia = posologiaController.text;
    final cuadro = selectedCuadros;

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
      return true;
    } else {
      if (otroNombre.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Debe ingresar otro nombre para el medicamento'),
          ),
        );
        return true;
      } else {
        if (presentacion.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Debe ingresar la presentanción de los medicamentos'),
            ),
          );
          return true;
        } else {
          if (mecanismos.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Debe ingresar los mecanismos de acción'),
              ),
            );
            return true;
          } else {
            if (uso.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Debe ingresar los usos pedagogicos'),
                ),
              );
              return true;
            } else {
              if (efectos.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Debe ingresar los efectos adversos'),
                  ),
                );
                return true;
              } else {
                if (contraindicaciones.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Debe ingresar las contraindicaciones'),
                    ),
                  );
                  return true;
                } else {
                  if (posologia.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Debe ingresar la posología del medicamento'),
                      ),
                    );
                    return true;
                  }
                }
              }
            }
          }
        }
      }
    }

    setSelectedImages(imagenes); // Para imágenes regulares
    setSelectedImages2(farmacocinetica); // Para imágenes de farmacocinética

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
      final resultadoRegistro = fs.addMedication(
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
          imagenes.cast<File>(),
          farmacocinetica,
          cuadro.cast<Map>());

      if (resultadoRegistro != "") {
        Navigator.pop(context);
        // Registro exitoso, redirige a otra pantalla o realiza acciones necesarias
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ListMedicamentos()));
      } else {
        Navigator.pop(context);
        // Registro fallido, muestra un mensaje de error
        ScaffoldMessenger.of(currentContext).showSnackBar(
          const SnackBar(
            content: Text('Ha ocurrido un error al registrar al usuario.'),
          ),
        );
      }
      return true;
    } catch (e) {
      print('Error al registrar usuario: $e');
      // Maneja el error según tus necesidades
      return false;
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
        backgroundColor: const Color.fromARGB(255, 85, 145, 214),
        elevation: 0,
      ),
      body: Container(
        //FONDO
        decoration: const BoxDecoration(
          /*
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
          */
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
    return myTextFieldGeneral(
      controller: posologiaController,
      labelTxt: "Posología",
      hintText: "Ejemplo...",
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
              margin: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: const FarmacocineticaPickerWidget(),
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
              onCheckBoxChanged: (List<Map> items) {
                // Cuando se selecciona o deselecciona un elemento en MyCheckBox
                selectedCuadros = items;
                validarCheck(selectedCuadros);

                for (int i = 0; i < items.length; i++) {
                  if (items[i]['isChecked']) {
                    print("Name: ${items[i]['name']}");
                  }
                }

                print("Checkbox changed!"); // Agrega esta impresión de prueba
              },
            ),
          ),
        ],
      ),
    );
  }

  List<String> grupo = ['AINES'];

  _grupoMedicamento() {
    return Column(
      children: [
        MyDropDown(
          list: grupo,
          hintText: "Seleccione un grupo",
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
        grupo.add(nuevoGrupo);
      });
    }
  }

  _subgrupoFarmacologico() {
    List subgrupo = [
      'SALICILATOS',
      'DERIV DEL ÁCIDO ACÉTICO',
      'PARAAMINOFEROL',
      'DERIV DEL ÁCIDO PROPIÓNICO'
    ];
    return MyDropDown(
      list: subgrupo,
      hintText: "Seleccione un sub-grupo",
      onChanged: (value) {
        setState(() {
          selectedSubGrupo = value;
          print("selectedSubGrupo: $selectedSubGrupo");
        });
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
    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            alignment: Alignment.topLeft,
            child: const Text(
              "Imágen del medicamento",
            ),
          ),
          const SizedBox(height: 10),
          Container(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: const ImagePickerWidget(),
            ),
          ),
        ],
      ),
    );
  }
  // Resto de tu código de funciones _grupoMedicamento(), _subgrupoFarmacologico(), etc.
}
