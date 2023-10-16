import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Prueba extends StatelessWidget {
  const Prueba({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo de Slidable',
      home: Scaffold(
        body: ListView(
          children: [
            Slidable(
              // Especifique una clave si Slidable es desechable.
              key: const ValueKey(0),

              // El panel de acción de inicio es el que está en el lado izquierdo o superior.
              startActionPane: ActionPane(
                // Un motion es un widget utilizado para controlar cómo se anima el panel.
                motion: const ScrollMotion(),

                // Un panel puede despedir el Slidable.
                dismissible: DismissiblePane(onDismissed: () {}),

                // Todas las acciones se definen en el parámetro de children.
                children: const [
                  // Un SlidableAction puede tener un icono y/o una etiqueta.
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Eliminar',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Compartir',
                  ),
                ],
              ),

              // El panel de acción final es el que está en el lado derecho o inferior.
              endActionPane: const ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    // Una acción puede ser más grande que las demás.
                    flex: 2,
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archivo',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Guardar',
                  ),
                ],
              ),

              // El hijo del Slidable es lo que ve el usuario cuando el componente no se arrastra.
              child: const ListTile(title: Text('Desliza')),
            ),
            Slidable(
              // Especifique una clave si Slidable es desechable.
              key: const ValueKey(1),

              // El panel de acción de inicio es el que está en el lado izquierdo o superior.
              startActionPane: const ActionPane(
                // Un motion es un widget utilizado para controlar cómo se anima el panel.
                motion: ScrollMotion(),

                // Todas las acciones se definen en el parámetro de children.
                children: [
                  // Un SlidableAction puede tener un icono y/o una etiqueta.
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Eliminar',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Compartir',
                  ),
                ],
              ),

              // El panel de acción final es el que está en el lado derecho o inferior.
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: const [
                  SlidableAction(
                    // Una acción puede ser más grande que las demás.
                    flex: 2,
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archivo',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Guardar',
                  ),
                ],
              ),

              // El hijo del Slidable es lo que ve el usuario cuando el componente no se arrastra.
              child: const ListTile(title: Text('Desliza')),
            ),
          ],
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
