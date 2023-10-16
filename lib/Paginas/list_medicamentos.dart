import 'package:drugenius/Paginas/Nav_Bar.dart';
import 'package:drugenius/Paginas/drug_input.dart';
import 'package:drugenius/Paginas/medicamentos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListMedicamentos extends StatelessWidget {
  const ListMedicamentos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text("Listado de Medicamentos",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            textAlign: TextAlign.center),
        backgroundColor: const Color.fromARGB(255, 85, 145, 214),
        actions: [
          // Agrega un icono de búsqueda en la AppBar
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const DrugInput(), // Reemplaza con la pantalla deseada
                ),
              );
            },
          ),
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
      drawer: const NavBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Slidable(
              key: const ValueKey(0),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                // Un panel puede despedir el Slidable.
                //dismissible: DismissiblePane(onDismissed: () {}),
                children: const [
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Eliminar',
                  ),
                ],
              ),
              endActionPane: const ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Guardar',
                  ),
                ],
              ),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 237, 237, 237),
                ),
                child: Center(
                  child: ListTile(
                    leading: SizedBox(
                      width: 60,
                      height: 50,
                      child: Image.network(
                        "https://eqf.com.mx/wp-content/uploads/2022/08/ULT103.png", // Reemplaza con la URL de tu imagen
                        fit: BoxFit
                            .cover, // Puedes ajustar el ajuste de la imagen según tus necesidades
                      ),
                    ),
                    title: Text(
                      'Paracetamol',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const Medicamentos(), // Reemplaza con la pantalla deseada
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
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
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                      'Senósidos',
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
    /*
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Slidable(
              // Specify a key if the Slidable is dismissible.
              key: const ValueKey(0),

              // The start action pane is the one at the left or the top side.
              startActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: const ScrollMotion(),

                // A pane can dismiss the Slidable.
                dismissible: DismissiblePane(onDismissed: () {}),

                // All actions are defined in the children parameter.
                children: const [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),

              // The end action pane is the one at the right or the bottom side.
              endActionPane: const ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    // An action can be bigger than the others.
                    flex: 2,
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archive',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Save',
                  ),
                ],
              ),

              // The child of the Slidable is what the user sees when the
              // component is not dragged.
              child: const ListTile(title: Text('Slide me')),
            ),
            Slidable(
              // Specify a key if the Slidable is dismissible.
              key: const ValueKey(1),

              // The start action pane is the one at the left or the top side.
              startActionPane: const ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: ScrollMotion(),

                // All actions are defined in the children parameter.
                children: [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),

              // The end action pane is the one at the right or the bottom side.
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: const [
                  SlidableAction(
                    // An action can be bigger than the others.
                    flex: 2,
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archive',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Save',
                  ),
                ],
              ),

              // The child of the Slidable is what the user sees when the
              // component is not dragged.
              child: const ListTile(title: Text('Slide me')),
            ),
          ],
        ),
      ),
    );
    */
  }
}

void doNothing(BuildContext context) {}

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
