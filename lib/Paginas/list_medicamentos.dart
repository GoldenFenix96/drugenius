import 'package:drugenius/Paginas/Nav_Bar.dart';
import 'package:drugenius/Paginas/drug_input.dart';
import 'package:drugenius/Paginas/edit_drug.dart';
import 'package:drugenius/Paginas/medicamentos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:drugenius/Firebase_Services/firebase_services.dart';
import 'package:page_transition/page_transition.dart';

class ListMedicamentos extends StatefulWidget {
  const ListMedicamentos({super.key});

  @override
  State<ListMedicamentos> createState() => _ListMedicamentosState();
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

  void _verDetallesMedicamento(String id) {
    Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: const Duration(seconds: 1),
        reverseTransitionDuration: const Duration(seconds: 1),
        pageBuilder: (context, animation, _) {
          return FadeTransition(
            opacity: animation,
            child: Medicamentos(medicamentoId: id),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text("Medicamentos",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              textAlign: TextAlign.center),
          backgroundColor: const Color.fromARGB(255, 22, 112, 177),
          actions: [
            // Agrega un icono de búsqueda en la AppBar
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const DrugInput(),
                        type: PageTransitionType.fade,
                        duration: const Duration(seconds: 1),
                        reverseDuration: const Duration(seconds: 1)));
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Abre la barra de búsqueda o ejecuta una acción de búsqueda
                // Aquí puedes implementar la lógica para manejar la búsqueda.
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(
                    medicamentos,
                    _verDetallesMedicamento,
                  ),
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
            final grupo = medicamento['grupo'];
            final subgrupo = medicamento['subgrupo'];
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Slidable(
                    key: Key(id), // Usa el ID del medicamento como clave
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            _editarMedicamento(id, grupo, subgrupo);
                          },
                          backgroundColor: const Color(0xFF0392CF),
                          foregroundColor: Colors.white,
                          icon: Icons.save,
                          label: 'Editar',
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            _borrarMedicamento(id);
                          },
                          backgroundColor: const Color(0xFFFE4A49),
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
                          leading: medicamento['imagenUrl'] != null &&
                                  medicamento['imagenUrl'].isNotEmpty
                              ? SizedBox(
                                  width: 60,
                                  height: 50,
                                  child: Image.network(
                                    medicamento['imagenUrl'],
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : const SizedBox
                                  .shrink(), // No muestra nada si no hay imagen
                          title: Text(
                            nombre, // Mostrar el nombre del medicamento
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                          onTap: () {
                            _verDetallesMedicamento(id);
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

  void _editarMedicamento(String id, grupo, subgrupo) {
    Navigator.push(
        context,
        PageTransition(
            child: EditDrug(
              medicamentoId: id,
              grupo: grupo,
              subgrupo: subgrupo,
            ),
            type: PageTransitionType.fade,
            duration: const Duration(seconds: 1),
            reverseDuration: const Duration(seconds: 1)));
  }

  void _borrarMedicamento(String medicamentoId) async {
    await fs.deleteMedication(medicamentoId).then((_) {
      // Actualiza la lista de medicamentos después de borrar.
      obtenerMedicamentos();
    }).catchError((error) {
      // Maneja el caso en el que la eliminación falló.
      // ignore: avoid_print
      print("Error al borrar el medicamento: $error");
    });
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> medicamentos;
  final Function(String) onMedicamentoSelected;

  CustomSearchDelegate(this.medicamentos, this.onMedicamentoSelected);

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
    final searchResults = medicamentos.where((medicamento) {
      final nombre = medicamento['nombre'].toLowerCase();
      return nombre.contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final result = searchResults[index];
        final id = result['id'];
        return ListTile(
          title: Text(result['nombre']),
          onTap: () {
            onMedicamentoSelected(id);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchResults = medicamentos.where((medicamento) {
      final nombre = medicamento['nombre'].toLowerCase();
      return nombre.contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final result = searchResults[index];
        final id = result['id'];
        return ListTile(
          title: Text(result['nombre']),
          onTap: () {
            onMedicamentoSelected(id);
          },
        );
      },
    );
  }
}
