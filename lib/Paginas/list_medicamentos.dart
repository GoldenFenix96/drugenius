import 'package:drugenius/Paginas/Nav_Bar.dart';
import 'package:drugenius/Paginas/drug_input.dart';
import 'package:drugenius/Paginas/medicamentos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:drugenius/Firebase_Services/firebase_services.dart';

class ListMedicamentos extends StatefulWidget {
  const ListMedicamentos({super.key});

  @override
  _ListMedicamentosState createState() => _ListMedicamentosState();
}

class _ListMedicamentosState extends State<ListMedicamentos> {
  Firebase_services fs = Firebase_services();
  List<Map<String, dynamic>> medicamentos = [];
  @override
  void initState() {
    super.initState();
    // Llama al método para obtener los medicamentos
    obtenerMedicamentos();
  }

  Future<void> obtenerMedicamentos() async {
    final medicamentosObtenidos = await fs.getMedicamentos();
    if (medicamentosObtenidos != null) {
      setState(() {
        medicamentos = medicamentosObtenidos;
      });
    }
  }

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
        body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
          itemCount:
              medicamentos.length, // Reemplaza con tu lista de medicamentos
          itemBuilder: (context, index) {
            final medicamento = medicamentos[index];
            final id = medicamento['id'];
            final nombre = medicamento['nombre'];

            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Slidable(
                    key: Key(id), // Usa el ID del medicamento como clave
                    endActionPane: const ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: doNothing,
                          backgroundColor: Color(0xFF0392CF),
                          foregroundColor: Colors.white,
                          icon: Icons.save,
                          label: 'Editar',
                        ),
                        SlidableAction(
                          onPressed: doNothing,
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Borrar',
                        ),
                      ],
                    ),
                    child: Container(
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 237, 237, 237),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: SizedBox(
                            width: 60,
                            height: 50,
                            child: Image.network(
                              medicamento[
                                  'imagenUrl'], // Usa la URL de la imagen del medicamento
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            nombre, // Mostrar el nombre del medicamento
                            style: const TextStyle(
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
                                    Medicamentos(medicamentoId: id),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0), // Espacio entre los medicamentos
              ],
            );
          },
        ));
  }

  void _editarMedicamento(String medicamentoId) {
    // Implementa la lógica para editar el medicamento
  }

  void _borrarMedicamento(String medicamentoId) {
    // Implementa la lógica para borrar el medicamento
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
