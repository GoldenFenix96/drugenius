import 'package:card_swiper/card_swiper.dart';
import 'package:drugenius/Firebase_Services/firebase_services.dart';
import 'package:flutter/material.dart';

class Medicamentos extends StatefulWidget {
  final String medicamentoId;

  Medicamentos({super.key, required this.medicamentoId});
  @override
  _MedicamentosState createState() => _MedicamentosState();
}

List<String> images = [];
List<String> farmacocinetica = [];
List<Map> cuadro = [];

class _MedicamentosState extends State<Medicamentos> {
  Firebase_services fs = Firebase_services();
  List<Map<String, dynamic>> medicamento = [];

  String nombre = '';
  String otro = '';
  String contra = '';
  String efectos = '';
  String grupo = '';
  String subgrupo = '';
  String posologia = '';
  String presentacion = '';
  String usoTera = '';
  String mecanismos = '';

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
        nombre = medicamentoObtenido['nombre'];
        otro = medicamentoObtenido['otroNombre'];
        contra = medicamentoObtenido['contra'];
        efectos = medicamentoObtenido['efectos'];
        grupo = medicamentoObtenido['grupo'];
        subgrupo = medicamentoObtenido['subgrupo'];
        posologia = medicamentoObtenido['posologia'];
        presentacion = medicamentoObtenido['presentacion'];
        usoTera = medicamentoObtenido['uso'];
        mecanismos = medicamentoObtenido['mecanismo'];
        farmacocinetica = medicamentoObtenido['farmaUrls'];
        cuadro = medicamentoObtenido['cuadroBasico'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Datos del medicamento",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            textAlign: TextAlign.center),
        backgroundColor: const Color.fromARGB(255, 22, 112, 177),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
        children: <Widget>[
          Visibility(
            visible: images.isNotEmpty,
            child: Center(
              child: swiperBoxImagenes(),
            ),
          ),
          const SizedBox(height: 20),
          Center(
              child: SizedBox(
            child: Text(nombre,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.black)),
          )),
          const SizedBox(height: 20),
          ExpansionTile(
            title: const SizedBox(
              child: Text(
                'Otros Nombres',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  otro,
                  style: const TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ExpansionTile(
            title: const SizedBox(
              child: Text(
                'Grupo',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  grupo,
                  style: const TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ExpansionTile(
            title: const SizedBox(
              child: Text(
                'Sub grupo',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  subgrupo,
                  style: const TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ExpansionTile(
            title: const SizedBox(
              child: Text(
                'Presentación del fármaco',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  presentacion,
                  style: const TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ExpansionTile(
            title: const SizedBox(
              child: Text(
                'Mecanismo de acción',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  mecanismos,
                  style: const TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ExpansionTile(
            title: const SizedBox(
              child: Text(
                'Uso terapéutico',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  usoTera,
                  style: const TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ExpansionTile(
            title: const SizedBox(
              child: Text(
                'Efectos adversos',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  efectos,
                  style: const TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ExpansionTile(
            title: const SizedBox(
              child: Text(
                'Contraindicaciones',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  contra,
                  style: const TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ExpansionTile(
            title: const SizedBox(
              child: Text(
                'Posología',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  posologia,
                  style: const TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ExpansionTile(
            title: const SizedBox(
              child: Text(
                'Cuadro básico',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  cuadro
                      .where((element) => element['isChecked'] == true)
                      .map((element) => element['name'])
                      .join(', '),
                  style: const TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: farmacocinetica
                .isNotEmpty, // Condición: muestra si farmacocinetica no está vacío
            child: ExpansionTile(
              title: const SizedBox(
                child: Text(
                  'Farmacocinética',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              children: <Widget>[
                Center(
                  child: swiperBoxFarmaco(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget swiperBoxImagenes() {
  return SizedBox(
      width: double.infinity,
      height: 250.0,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        itemBuilder: (BuildContext context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              images[index],
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: images.length,
        pagination: const SwiperPagination(),
        autoplay: true, // Habilita la reproducción automática
        autoplayDelay:
            3000, // Establece el tiempo de espera entre transiciones (en milisegundos)
      ));
}

Widget swiperBoxFarmaco() {
  return SizedBox(
    width: double.infinity,
    height: 250.0,
    child: Swiper(
      viewportFraction: 0.8,
      scale: 0.9,
      itemBuilder: (BuildContext context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            farmacocinetica[index],
            fit: BoxFit.fill,
          ),
        );
      },
      itemCount: farmacocinetica.length, // Usar la longitud de farmacocinetica
      pagination: const SwiperPagination(),
    ),
  );
}
