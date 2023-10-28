import 'package:drugenius/Componentes/my_button_general.dart';
import 'package:drugenius/Paginas/blank_page_calculadora.dart';
import 'package:drugenius/Paginas/blank_page_evaluaciones.dart';
import 'package:drugenius/Paginas/blank_page_foro.dart';
import 'package:drugenius/Paginas/blank_page_games.dart';
import 'package:drugenius/Paginas/generalidades.dart';
import 'package:drugenius/Paginas/list_medicamentos.dart';

import 'package:drugenius/Paginas/video_audio.dart';
import 'package:flutter/material.dart';
import 'package:drugenius/Paginas/Nav_Bar.dart';
import 'package:page_transition/page_transition.dart';

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
          backgroundColor: const Color.fromARGB(255, 22, 112, 177),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                      const SizedBox(
                        child: Text(
                          '¡Bienvenido!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Fila 1
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          _btnGeneralidades(),
                          // Espacio entre los contenedores
                          _btnMedicamentos(),
                        ],
                      ),
                      const SizedBox(height: 5), // Espacio entre las filas
                      // Fila 2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          _btnPodcastVideos(),

                          // Segundo Container
                          _btnForo(),
                        ],
                      ),

                      const SizedBox(height: 5), // Espacio entre las filas
                      // Fila 3
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          _btnEvaluaciones(),
                          // Segundo Container
                          _btnCalculadora(),
                        ],
                      ),

                      const SizedBox(height: 5), // Espacio entre las filas
                      // Fila 4
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          _btnJuegos(),

                          // Segundo Container
                          //_btnFarmacocinetica(),
                          const SizedBox(
                            width: 140,
                            height: 160,
                          )
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

  _btnGeneralidades() {
    return Container(
      color: const Color.fromARGB(0, 233, 159, 159),
      width: 140,
      height: 160,
      child: Column(
        // Primer Container
        children: [
          MyButtonHome(
            imageNet: 'https://i.ibb.co/RbF9r98/Generalidades-icono.png',
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: const generalidades(),
                      type: PageTransitionType.bottomToTop));
            },
          ),
          // Espacio entre los contenedores
          const SizedBox(height: 5),
          const Text(
            'Generalidades',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }

  _btnMedicamentos() {
    return Container(
      color: const Color.fromARGB(0, 255, 255, 255),
      width: 140,
      height: 160,
      child: Column(
        // Primer Container
        children: [
          MyButtonHome(
              imageNet: 'https://i.ibb.co/C5QYQnc/Medicamentos-icono.png',
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const ListMedicamentos(),
                        type: PageTransitionType.bottomToTop));
              }),
          const SizedBox(height: 5),
          const Text(
            'Medicamentos',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }

  _btnEvaluaciones() {
    return Container(
      color: const Color.fromARGB(0, 255, 255, 255),
      width: 140,
      height: 160,
      child: Column(
        // Primer Container
        children: [
          MyButtonHome(
              imageNet: 'https://i.ibb.co/k1zSJ8V/Evaluaciones-icono.png',
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const BlankPageEvaluaciones(),
                        type: PageTransitionType.bottomToTop));
              }),
          // Texto debajo del primer Container
          // Espacio entre los contenedores
          const SizedBox(height: 5),
          const Text(
            'Evaluaciones',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }

  _btnJuegos() {
    return Container(
      color: const Color.fromARGB(0, 255, 255, 255),
      width: 140,
      height: 160,
      child: Column(
        // Primer Container
        children: [
          MyButtonHome(
            imageNet: 'https://i.ibb.co/J31jbkP/Juegos-icono.png',
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: const BlankPage(),
                      type: PageTransitionType.bottomToTop));
            },
          ),
          // Texto debajo del primer Container
          // Espacio entre los contenedores
          const SizedBox(height: 5),
          const Text(
            'Juegos',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }

  _btnPodcastVideos() {
    return Container(
      color: const Color.fromARGB(0, 255, 255, 255),
      width: 140,
      height: 160,
      child: Column(
        // Primer Container
        children: [
          MyButtonHome(
            imageNet: 'https://i.ibb.co/Twr8dw8/Videopodcast-icono.png',
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: const VideoAudio(),
                      type: PageTransitionType.bottomToTop));
            },
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
        ],
      ),
    );
  }

  _btnForo() {
    return Container(
      color: const Color.fromARGB(0, 255, 255, 255),
      width: 140,
      height: 160,
      child: Column(
        // Primer Container
        children: [
          MyButtonHome(
              imageNet: 'https://i.ibb.co/0tQdZpr/Foro-icono2.png',
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const BlankPageForo(),
                        type: PageTransitionType.bottomToTop));
              }),
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
        ],
      ),
    );
  }

  _btnCalculadora() {
    return Container(
      color: const Color.fromARGB(0, 255, 255, 255),
      width: 140,
      height: 160,
      child: Column(
        // Primer Container
        children: [
          MyButtonHome(
              imageNet: 'https://i.ibb.co/NCyS2SK/Calculadora-icono.png',
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const BlankPageCalculadora(),
                        type: PageTransitionType.bottomToTop));
              }),
          // Texto debajo del primer Container
          // Espacio entre los contenedores
          const SizedBox(height: 5),
          const Expanded(
            child: Text(
              'Calculadora de dosis',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}