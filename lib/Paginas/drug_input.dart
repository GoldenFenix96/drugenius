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

final TextEditingController _usernameController = TextEditingController();

class _DrugInputState extends State<DrugInput> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const Text(
          "Ingreso de medicamentos",
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromRGBO(253, 200, 66, 1),
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
                  //TXT DRUG INPUT

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
                  _receptoresMedicamento(),
                  const SizedBox(height: 15.0),
                  _usoTerapeutico(),
                  const SizedBox(height: 15.0),
                  _efectosAdversos(),
                  const SizedBox(height: 15.0),
                  _contraIndicacionesMedicamento(),
                  const SizedBox(height: 15.0),
                  _posologiaMedicamento(),
                  const SizedBox(height: 15.0),
                  _recomendacionesMedicamentos(),
                  const SizedBox(height: 15.0),
                  _casosClinicos(),
                  const SizedBox(height: 15.0),
                  _cuadroBasico(),
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
        controller: _usernameController,
        labelTxt: "Nombre del medicamento",
        hintText: "Paracetamol",
        onChanged: (value) {});
  }

  _mecanismosDeAccion() {
    return myTextFieldGeneral(
      controller: _usernameController,
      labelTxt: "Mecanismos de acción",
      hintText: "Inhibición de enzimas",
      onChanged: (value) {},
    );
  }

  _receptoresMedicamento() {
    return TextFormFieldGeneral(
      labelTxt: "Receptores",
      hintText: "Ejemplo...",
      onChanged: (value) {},
    );
  }

  _usoTerapeutico() {
    return TextFormFieldGeneral(
      labelTxt: "Uso terapéutico",
      hintText: "Ejemplo...",
      onChanged: (value) {},
    );
  }

  _efectosAdversos() {
    return TextFormFieldGeneral(
      labelTxt: "Efectos adversos",
      hintText: "Ejemplo...",
      onChanged: (value) {},
    );
  }

  _posologiaMedicamento() {
    return myTextFieldGeneral(
      controller: _usernameController,
      labelTxt: "Posología",
      hintText: "Ejemplo...",
      onChanged: (value) {},
    );
  }

  _recomendacionesMedicamentos() {
    return TextFormFieldGeneral(
      labelTxt: "Recomendaciones",
      hintText: "Ejemplo...",
      onChanged: (value) {},
    );
  }

  _casosClinicos() {
    return TextFormFieldGeneral(
      labelTxt: "Casos clínicos",
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
    return TextFormFieldGeneral(
      labelTxt: "Cuadro básico",
      hintText: "Ejemplo...",
      onChanged: (value) {},
    );
  }

  _grupoMedicamento() {
    List grupo = ['AINES', 'OTROS'];
    return MyDropDown(
      list: grupo,
      hintText: "Seleccione un grupo",
    );
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
      controller: _usernameController,
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
              "Imagen del medicamento",
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
