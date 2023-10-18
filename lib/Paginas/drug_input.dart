import 'package:drugenius/Componentes/my_checkbpx_general.dart';
import 'package:drugenius/Firebase_Services/firebase_services.dart';
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

final TextEditingController otroNombreController = TextEditingController();
final TextEditingController grupoController = TextEditingController();
final TextEditingController subgrupoController = TextEditingController();
final TextEditingController nombreController = TextEditingController();
final TextEditingController presentacionController = TextEditingController();
final TextEditingController mecanismosController = TextEditingController();
final TextEditingController usoTeraController = TextEditingController();
final TextEditingController efectosController = TextEditingController();
final TextEditingController contraController = TextEditingController();
final TextEditingController posologiaController = TextEditingController();
final TextEditingController cuadroController = TextEditingController();

Firebase_services fs = Firebase_services();

class _DrugInputState extends State<DrugInput> {
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
                        onPressed: () {},
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
              child: const ImagePickerWidget(),
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
            child: Container(
              child: const MyCheckBox(),
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
                  borderRadius: BorderRadius.circular(
                      10.0), // Cambia el radio de la esquina para personalizar la forma
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
                //fontFamily: 'Montserrat',
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
      labelTxt: "Presentación del farmáco",
      hintText: "Tableta  (500mg). Tableta soluble o efervescente (300mg)...",
      onChanged: (value) {},
    );
  }

  _contraIndicacionesMedicamento() {
    return TextFormFieldGeneral(
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

  Widget _imagenFarmacocinetica() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            alignment: Alignment.topLeft,
            child: const Text(
              "Farmacocinetica",
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
