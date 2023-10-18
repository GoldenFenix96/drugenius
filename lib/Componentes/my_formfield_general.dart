import 'package:flutter/material.dart';

class TextFormFieldGeneral extends StatelessWidget {
  final String labelTxt;
  final String hintText;
  final Function onChanged;
  final IconData icon;
  final TextEditingController? controller;
  const TextFormFieldGeneral({
    super.key,
    required this.labelTxt,
    required this.hintText,
    required this.onChanged,
    this.icon = Icons.text_format_outlined,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: TextFormField(
        minLines: 2,
        maxLines: 10,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromARGB(255, 204, 204, 204),
          )),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
          fillColor: const Color.fromARGB(255, 204, 204, 204),
          filled: true,
          prefixIcon: Icon(icon),
          labelText: labelTxt,
          hintText: hintText,
          hintStyle: const TextStyle(
            //fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
          labelStyle: const TextStyle(
            //fontFamily: 'Montserrat',
            color: Color.fromARGB(255, 33, 33, 33),
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
