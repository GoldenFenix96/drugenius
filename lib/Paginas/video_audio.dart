//import 'package:card_swiper/card_swiper.dart';
import 'package:drugenius/Paginas/addMulti.dart';
import 'package:drugenius/Paginas/nav_audios/audios.dart';
import 'package:drugenius/Paginas/nav_videos/videos.dart';
import 'package:drugenius/main.dart';
import 'package:flutter/material.dart';

class VideoAudio extends StatefulWidget {
  const VideoAudio({super.key});

  @override
  State<VideoAudio> createState() => _VideoAudioState();
}

List<String> imagen = [
  "https://picsum.photos/id/1/400/300",
  "https://picsum.photos/id/2/400/300",
];

class _VideoAudioState extends State<VideoAudio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 85, 145, 214),
        elevation: 10,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Multi",
              style: TextStyle(fontSize: 35, color: Colors.black),
            ),
            Text(
              "Media",
              style: TextStyle(fontSize: 35, color: Colors.white),
            )
          ],
        ),
        //actions: <Widget>[
        //  IconButton(
        //    icon: Icon(Icons.),
        //    onPressed: () {
        //      Navigator.push(
        //          context, MaterialPageRoute(builder: (context) => AddMulti()));
        //    },
        //   ),
        //   IconButton(
        //     icon: Icon(Icons.login),
        //     onPressed: _add,
        //   ),
        // ],
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.elliptical(20, 20))),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const DrugeniusMenu(), // Reemplaza con la pantalla deseada
              ),
            );
          },
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Videos()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.video_camera_front,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "Video",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Audios()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.lightBlueAccent,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.podcasts,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "Podcast",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddMulti()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "Carga",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Text(
                        "Multimedia",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              //swiperBox(),
              //swiperBox(),
            ],
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 10, crossAxisSpacing: 10),
          ),
        ),
      ),
    );
  }
}

void _add() {}

/*Widget swiperBox() {
  return SizedBox(
    width: double.infinity,
    height: 181.0,
    child: Swiper(
      viewportFraction: 1,
      scale: 1,
      itemBuilder: (BuildContext context, index) {
        return ElevatedButton(
          onPressed: () {
            // Navegación basada en el índice seleccionado
            switch (index) {
              case 0:
                // Acción cuando se presiona el botón correspondiente al ítem 0
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const VideoPlayerWidget(), // Reemplaza con la pantalla deseada
                  ),
                );
                break;
              case 1:
                // Acción cuando se presiona el botón correspondiente al ítem 1
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const AddMulti(), // Reemplaza con la pantalla deseada
                  ),
                );
                break;
              case 2:
                // Acción cuando se presiona el botón correspondiente al ítem 2
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MyAudioPlayer(), // Reemplaza con la pantalla deseada
                  ),
                );
                break;
              default:
                // Acción por defecto o para otros ítems si es necesario
                break;
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(
                255, 255, 255, 255), // Color de fondo del botón
          ),
          child: Column(
            children: [
              Image.network(
                imagen[index], // URL de la imagen
                fit: BoxFit.cover, // Ajusta la imagen para cubrir todo el espacio disponible
              ),
            ],
          ),
        );
      },
      itemCount: imagen.length,
      pagination: const SwiperPagination(),

      autoplay: true, // Habilita la reproducción automática
      autoplayDelay:
          5000, // Establece el tiempo de espera entre transiciones (en milisegundos)
    ),
  );
}*/
