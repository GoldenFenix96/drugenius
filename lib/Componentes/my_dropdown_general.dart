import 'package:flutter/material.dart';

class myDropDown extends StatelessWidget {
  final List list;
  final String hintText;
  const myDropDown({required this.list, required this.hintText});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
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
              child: Text(name),
              value: name,
            );
          }).toList(),
          onChanged: (value) {
            print(value);
          },
        ),
      ),
    );
  }
}
