import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Prueba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane:
          SlidableDrawerActionPane(), // Establece el estilo de deslizamiento
      actionExtentRatio:
          0.25, // Define el porcentaje del ancho del elemento que se mostrará al deslizar

      child: ListTile(
        title: Text("Hola culos"),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Editar',
          color: Colors.blue,
          icon: Icons.edit,
          onTap: () {
            // Acción al tocar el botón "Editar"
            // Aquí puedes abrir una pantalla de edición, por ejemplo
          },
        ),
        IconSlideAction(
          caption: 'Eliminar',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            // Acción al tocar el botón "Eliminar"
            // Aquí puedes eliminar el elemento, por ejemplo
          },
        ),
      ],
    );
  }
}
