// ignore_for_file: empty_constructor_bodies

import 'package:card_swiper/card_swiper.dart';
import 'package:drugenius/Paginas/generalidades.dart';
import 'package:drugenius/Paginas/list_medicamentos.dart';
import 'package:drugenius/Paginas/loggin_page.dart';
import 'package:drugenius/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:drugenius/Paginas/Nav_Bar.dart';

//importaciones de FireBase
import 'package:firebase_core/firebase_core.dart';
import 'Paginas/blank_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    home: SplashScreen(),
  ));
}

class DrugeniusMenu extends StatefulWidget {
  const DrugeniusMenu({super.key});

  @override
  State<DrugeniusMenu> createState() => _DrugeniusMenuState();
}

List<String> images2 = [
  "https://cdn-v1.udocz-assets.com/uploads/book/cover/166526/farmacocinetica-c39e7f78521e8c6587932828f579b42d.jpg",
  "https://cdn-v1.udocz-assets.com/uploads/book/cover/166526/farmacocinetica-c39e7f78521e8c6587932828f579b42d.jpg",
  "https://cdn-v1.udocz-assets.com/uploads/book/cover/166526/farmacocinetica-c39e7f78521e8c6587932828f579b42d.jpg"
];

class _DrugeniusMenuState extends State<DrugeniusMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 85, 145, 214),
          elevation: 0,
          title: Image.network(
            'https://i.ibb.co/0FZPjNw/Logo-Drugenius.png', // URL de la imagen en internet
            width: 300, // Ancho de la imagen
            height: 200, // Altura de la imagen
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(253, 200, 66, 0.143),
              ],
              stops: [0.1, 0.9],
            ),
          ),
          child: ListView(
            children: [
              Center(
                child: Container(
                  color: const Color.fromARGB(0, 255, 255, 255),
                  margin: const EdgeInsets.fromLTRB(
                      20.0, 20.0, 20.0, 30.0), // Margen alrededor de la Column
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //swiperBox(),
                      //SizedBox(height: 20),
                      // Fila 1
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                              color: const Color.fromARGB(0, 233, 159, 159),
                              width: 140,
                              height: 160,
                              child: Column(

                                  // Primer Container
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // Acción cuando se presiona el botón
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const generalidades(), // Reemplaza con la pantalla deseada
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),

                                        backgroundColor: const Color.fromARGB(
                                            210, 252, 248, 192),
                                        // Establece la forma circular
                                        padding: const EdgeInsets.all(0),
                                        elevation: 10,

                                        side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 145, 152, 252),
                                        ),
                                      ),
                                      child: Container(
                                        width: 110,
                                        height: 110,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape
                                              .circle, // Establece la forma circular
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              'https://i.ibb.co/74M1Zv2/Generalidades.png', // URL de la imagen en internet
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Texto debajo del primer Container
                                    // Espacio entre los contenedores
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Generalidades',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ])),

                          // Espacio entre los contenedores
                          Container(
                              color: const Color.fromARGB(0, 255, 255, 255),
                              width: 140,
                              height: 160,
                              child: Column(
                                  // Primer Container
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ListMedicamentos(), // Reemplaza con la pantalla deseada
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),

                                        backgroundColor: const Color.fromARGB(
                                            210, 252, 248, 192),
                                        // Establece la forma circular
                                        padding: const EdgeInsets.all(0),
                                        elevation: 10,

                                        side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 145, 152, 252),
                                        ),
                                      ),
                                      child: Container(
                                        width: 110,
                                        height: 110,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape
                                              .circle, // Establece la forma circular
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              'https://i.ibb.co/DgQd0Bt/Medicamentos.png', // URL de la imagen en internet
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Texto debajo del primer Container
                                    // Espacio entre los contenedores
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Medicamentos',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ])),
                        ],
                      ),
                      const SizedBox(height: 5), // Espacio entre las filas
                      // Fila 2
                      //swiperBox(),
                      const SizedBox(height: 5), // Espacio entre las filas
                      // Fila 3
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                              color: const Color.fromARGB(0, 255, 255, 255),
                              width: 140,
                              height: 160,
                              child: Column(
                                  // Primer Container
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const BlankPage(), // Reemplaza con la pantalla deseada
                                          ),
                                        );

                                        // Acción cuando se presiona el botón
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),

                                        backgroundColor: const Color.fromARGB(
                                            210, 252, 248, 192),
                                        // Establece la forma circular
                                        padding: const EdgeInsets.all(0),
                                        elevation: 10,

                                        side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 145, 152, 252),
                                        ),
                                      ),
                                      child: Container(
                                        width: 110,
                                        height: 110,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape
                                              .circle, // Establece la forma circular
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              'https://i.ibb.co/KqMrc9H/Evaluaciones.png',
                                              // URL de la imagen en internet
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Texto debajo del primer Container
                                    // Espacio entre los contenedores
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Evaluaciones',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ])),
                          // Segundo Container
                          Container(
                              color: const Color.fromARGB(0, 255, 255, 255),
                              width: 140,
                              height: 160,
                              child: Column(
                                  // Primer Container
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const BlankPage(), // Reemplaza con la pantalla deseada
                                          ),
                                        );
                                        // Acción cuando se presiona el botón
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),

                                        backgroundColor: const Color.fromARGB(
                                            210, 252, 248, 192),
                                        // Establece la forma circular
                                        padding: const EdgeInsets.all(0),
                                        elevation: 10,

                                        side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 145, 152, 252),
                                        ),
                                      ),
                                      child: Container(
                                        width: 110,
                                        height: 110,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape
                                              .circle, // Establece la forma circular
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              'https://i.ibb.co/tP1Lw7v/Juegos.png', // URL de la imagen en internet
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Texto debajo del primer Container
                                    // Espacio entre los contenedores
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Juegos',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ])),
                        ],
                      ),

                      const SizedBox(height: 5), // Espacio entre las filas
                      // Fila 4
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                              color: const Color.fromARGB(0, 255, 255, 255),
                              width: 140,
                              height: 160,
                              child: Column(
                                  // Primer Container
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const BlankPage(), // Reemplaza con la pantalla deseada
                                          ),
                                        );
                                        // Acción cuando se presiona el botón
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),

                                        backgroundColor: const Color.fromARGB(
                                            210, 252, 248, 192),
                                        // Establece la forma circular
                                        padding: const EdgeInsets.all(0),
                                        elevation: 10,

                                        side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 145, 152, 252),
                                        ),
                                      ),
                                      child: Container(
                                        width: 110,
                                        height: 110,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape
                                              .circle, // Establece la forma circular
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                'https://i.ibb.co/zZv1TH1/multimedia.png'), // URL de la imagen en internet
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Texto debajo del primer Container
                                    // Espacio entre los contenedores
                                    const SizedBox(height: 5),
                                    const Expanded(
                                      child: Text(
                                        'Podcast y Videos',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ])),
                          // Segundo Container
                          Container(
                              color: const Color.fromARGB(0, 255, 255, 255),
                              width: 140,
                              height: 160,
                              child: Column(
                                  // Primer Container
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const BlankPage(), // Reemplaza con la pantalla deseada
                                          ),
                                        );
                                        // Acción cuando se presiona el botón
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),

                                        backgroundColor: const Color.fromARGB(
                                            210, 252, 248, 192),
                                        // Establece la forma circular
                                        padding: const EdgeInsets.all(0),
                                        elevation: 10,

                                        side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 145, 152, 252),
                                        ),
                                      ),
                                      child: Container(
                                        width: 110,
                                        height: 110,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape
                                              .circle, // Establece la forma circular
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              'https://i.ibb.co/NVcvYJ7/charla-3.png', // URL de la imagen en internet
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Texto debajo del primer Container
                                    // Espacio entre los contenedores
                                    const SizedBox(height: 5),
                                    const Expanded(
                                      child: Text(
                                        'Foro de Discusión',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ])),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget swiperBox() {
  return SizedBox(
    width: double.infinity,
    height: 181.0,
    child: Swiper(
      viewportFraction: 1,
      scale: 1,
      itemBuilder: (BuildContext context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  images2[index], // URL de la imagen
                  fit: BoxFit
                      .cover, // Ajusta la imagen para cubrir todo el espacio disponible
                ),
              ),
            ],
          ),
        );
      },
      itemCount: images2.length,
      pagination: const SwiperPagination(),

      autoplay: true, // Habilita la reproducción automática
      autoplayDelay:
          5000, // Establece el tiempo de espera entre transiciones (en milisegundos)
    ),
  );

  /*
  return SizedBox(
    width: double.infinity,
    height: 181.0,
    child: Swiper(
      viewportFraction: 1,
      scale: 1,
      itemBuilder: (BuildContext context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: ElevatedButton(
            onPressed: () {
              // Navegación basada en el índice seleccionado
              switch (index) {
                case 0:
                  // Acción cuando se presiona el botón correspondiente al ítem 0
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const Farmacocinetica(), // Reemplaza con la pantalla deseada
                    ),
                  );
                  break;
                case 1:
                  // Acción cuando se presiona el botón correspondiente al ítem 1
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ListMedicamentos(), // Reemplaza con la pantalla deseada
                    ),
                  );
                  break;
                case 2:
                  // Acción cuando se presiona el botón correspondiente al ítem 2
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ListMedicamentos(), // Reemplaza con la pantalla deseada
                    ),
                  );
                  break;
                default:
                  // Acción por defecto o para otros ítems si es necesario
                  break;
              }
            },
            style: ElevatedButton.styleFrom(
              maximumSize: Size.fromHeight(100),
              backgroundColor: const Color.fromARGB(
                  255, 255, 255, 255), // Color de fondo del botón
            ),
            child: Column(
              children: [
                Image.network(
                  images2[index], // URL de la imagen
                  fit: BoxFit
                      .cover, // Ajusta la imagen para cubrir todo el espacio disponible
                ),
              ],
            ),
          ),
        );
      },
      itemCount: images2.length,
      pagination: const SwiperPagination(),

      autoplay: true, // Habilita la reproducción automática
      autoplayDelay:
          5000, // Establece el tiempo de espera entre transiciones (en milisegundos)
    ),
  );
  */
}
