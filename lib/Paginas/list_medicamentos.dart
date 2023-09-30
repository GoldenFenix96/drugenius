import 'package:drugenius/Paginas/medicamentos.dart';
import 'package:flutter/material.dart';

class ListMedicamentos extends StatelessWidget {
  const ListMedicamentos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listado de Medicamentos",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            textAlign: TextAlign.center),
        backgroundColor: const Color.fromARGB(255, 84, 132, 160),
        actions: [
          // Agrega un icono de búsqueda en la AppBar
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Abre la barra de búsqueda o ejecuta una acción de búsqueda
              // Aquí puedes implementar la lógica para manejar la búsqueda.
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Medicamentos(), // Reemplaza con la pantalla deseada
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.white, // Cambia el color de fondo del botón aquí
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 50,
                    child: Image.network(
                      "https://paracetamol.bayer.com.ar/sites/g/files/vrxlpx30376/files/2022-10/PACK%20PARACETAMOL%20BAYER.png?imwidth=5000", // Reemplaza con la URL de tu imagen
                      fit: BoxFit
                          .cover, // Puedes ajustar el ajuste de la imagen según tus necesidades
                    ),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    child: Text(
                      'Paracetamol',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.black),
                    ),
                  ),
                ],
              )),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Medicamentos(), // Reemplaza con la pantalla deseada
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.white, // Cambia el color de fondo del botón aquí
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 50,
                    child: Image.network(
                      "https://eqf.com.mx/wp-content/uploads/2022/08/ULT134.png", // Reemplaza con la URL de tu imagen
                      fit: BoxFit
                          .cover, // Puedes ajustar el ajuste de la imagen según tus necesidades
                    ),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    child: Text(
                      'Omeprazol',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.black),
                    ),
                  ),
                ],
              )),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Medicamentos(), // Reemplaza con la pantalla deseada
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.white, // Cambia el color de fondo del botón aquí
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 50,
                    child: Image.network(
                      "https://eqf.com.mx/wp-content/uploads/2022/08/ULT103.png", // Reemplaza con la URL de tu imagen
                      fit: BoxFit
                          .cover, // Puedes ajustar el ajuste de la imagen según tus necesidades
                    ),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    child: Text(
                      'Diclofenaco',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.black),
                    ),
                  ),
                ],
              )),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Medicamentos(), // Reemplaza con la pantalla deseada
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.white, // Cambia el color de fondo del botón aquí
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 50,
                    child: Image.network(
                      "https://tienda.farmaciasroma.com/media/catalog/product/cache/8cfc93e6196efd5c8964fe64a59d97bb/1/e/1ea4ee650fe90b55f81e8c7ef7f18ffb_7502216796393-1.png", // Reemplaza con la URL de tu imagen
                      fit: BoxFit
                          .cover, // Puedes ajustar el ajuste de la imagen según tus necesidades
                    ),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    child: Text(
                      'Senosidos',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.black),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Paracetamol",
    "Omeprazol",
    "Diclofenaco",
    "Senosidos"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var med in searchTerms) {
      if (med.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(med);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var med in searchTerms) {
      if (med.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(med);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
