import 'package:flutter/material.dart';

class MyDropDown extends StatelessWidget {
  final List list;
  final String hintText;
  final Null Function(dynamic value)
      onChanged; // Cambio en la firma del parámetro
  const MyDropDown({
    super.key,
    required this.list,
    this.hintText = "",
    required this.onChanged,
    required String value, // Actualización en la firma del parámetro
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: Center(
        child: DropdownButtonFormField(
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 204, 204, 204),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            fillColor: Color.fromARGB(255, 204, 204, 204),
            filled: true,
            prefixIcon: Icon(Icons.text_format_outlined),
          ),
          hint: Text(
            hintText,
            style: const TextStyle(
              //fontFamily: 'Montserrat',

              fontWeight: FontWeight.normal,
            ),
          ),
          items: list.map((name) {
            return DropdownMenuItem(
              value: name,
              child: Text(name, style: const TextStyle(fontSize: 15)),
            );
          }).toList(),
          onChanged: (value) {
            // Llama a la función onChanged pasando el valor seleccionado
            onChanged(value);
          },
        ),
      ),
    );
  }
}
