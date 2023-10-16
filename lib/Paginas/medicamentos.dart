import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

List<String> images = [
  "https://paracetamol.bayer.com.ar/sites/g/files/vrxlpx30376/files/2022-10/PACK%20PARACETAMOL%20BAYER.png?imwidth=5000",
  "https://eqf.com.mx/wp-content/uploads/2022/07/ALP0430.png",
  "https://nyal.com.au/wp-content/uploads/2022/04/92840_Nyal_A4275-Paracetamol-Tab-20_2D-FOP-RENDER.png"
];

class Medicamentos extends StatelessWidget {
  const Medicamentos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paracetamol",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            textAlign: TextAlign.center),
        backgroundColor: const Color.fromARGB(255, 85, 145, 214),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
        children: <Widget>[
          Center(
            child: swiperBox(),
          ),
          const Center(
              child: SizedBox(
            child: Text("Paracetamol",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.black)),
          )),
          const SizedBox(height: 20),
          const ExpansionTile(
            title: SizedBox(
              child: Text(
                'Mecanismos de acción',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  'Es un fármaco seguro para tratar una amplia variedad de problemas. Pero si se da en dosis muy altas puede hacer que el niño se ponga muy enfermo.',
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const ExpansionTile(
            title: SizedBox(
              child: Text(
                'Receptores',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  'Es un fármaco seguro para tratar una amplia variedad de problemas. Pero si se da en dosis muy altas puede hacer que el niño se ponga muy enfermo.',
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const ExpansionTile(
            title: SizedBox(
              child: Text(
                'Uso terapéutico',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  'Es un fármaco seguro para tratar una amplia variedad de problemas. Pero si se da en dosis muy altas puede hacer que el niño se ponga muy enfermo.',
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const ExpansionTile(
            title: SizedBox(
              child: Text(
                'Mecanismos de acción',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  'Es un fármaco seguro para tratar una amplia variedad de problemas. Pero si se da en dosis muy altas puede hacer que el niño se ponga muy enfermo.',
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const ExpansionTile(
            title: SizedBox(
              child: Text(
                'Efectos adversos',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  'Es un fármaco seguro para tratar una amplia variedad de problemas. Pero si se da en dosis muy altas puede hacer que el niño se ponga muy enfermo.',
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const ExpansionTile(
            title: SizedBox(
              child: Text(
                'Posología',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  'Es un fármaco seguro para tratar una amplia variedad de problemas. Pero si se da en dosis muy altas puede hacer que el niño se ponga muy enfermo.',
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const ExpansionTile(
            title: SizedBox(
              child: Text(
                'Interacciones medicas',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  'Es un fármaco seguro para tratar una amplia variedad de problemas. Pero si se da en dosis muy altas puede hacer que el niño se ponga muy enfermo.',
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const ExpansionTile(
            title: SizedBox(
              child: Text(
                'Recomendaciones',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  'Es un fármaco seguro para tratar una amplia variedad de problemas. Pero si se da en dosis muy altas puede hacer que el niño se ponga muy enfermo.',
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const ExpansionTile(
            title: SizedBox(
              child: Text(
                'Farmacocinética',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  'Es un fármaco seguro para tratar una amplia variedad de problemas. Pero si se da en dosis muy altas puede hacer que el niño se ponga muy enfermo.',
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget swiperBox() {
  return SizedBox(
      width: double.infinity,
      height: 250.0,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        itemBuilder: (BuildContext context, index) {
          return Image.network(
            images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: images.length,
        pagination: const SwiperPagination(),
        autoplay: true, // Habilita la reproducción automática
        autoplayDelay:
            3000, // Establece el tiempo de espera entre transiciones (en milisegundos)
      ));
}
