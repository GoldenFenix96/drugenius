import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  final List<Map> items;
  final Function(List<Map>) onCheckBoxChanged;

  MyCheckBox({required this.items, required this.onCheckBoxChanged, Key? key})
      : super(key: key);

  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 204, 204, 204),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: widget.items.map(
          (favorite) {
            return CheckboxListTile(
              title: Text(favorite['name']),
              value: favorite['isChecked'],
              onChanged: (val) {
                // Almacenar el estado actual de isChecked
                bool currentVal = favorite['isChecked'];

                setState(() {
                  favorite['isChecked'] = val;
                });

                // Llamar a la función de callback para notificar cambios
                widget.onCheckBoxChanged(widget.items);

                // Validación para asegurarse de que al menos uno esté seleccionado
                bool atLeastOneSelected =
                    widget.items.any((item) => item['isChecked']);
                if (!atLeastOneSelected) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Selecciona al menos un elemento'),
                    ),
                  );

                  // Restaurar el estado original si todos los elementos están deseleccionados
                  if (!atLeastOneSelected) {
                    setState(() {
                      favorite['isChecked'] = currentVal;
                    });
                  }
                }
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
