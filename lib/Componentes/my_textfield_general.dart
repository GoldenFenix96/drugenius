import 'package:flutter/material.dart';

class myTextFieldGeneral extends StatelessWidget {
  final String labelTxt;
  final String hintText;
  final Function onChanged;
  final TextInputType keyboardType;
  final IconData icon;
  final bool obscureText;
  final FontWeight fontWeight;
  const myTextFieldGeneral({
    this.hintText = "",
    this.icon = Icons.text_format_outlined,
    this.keyboardType = TextInputType.text,
    required this.labelTxt,
    required this.onChanged,
    this.obscureText = false,
    this.fontWeight = FontWeight.normal,
    required TextEditingController controller,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
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
          labelStyle: TextStyle(
            //fontFamily: 'Montserrat',
            color: const Color.fromARGB(255, 33, 33, 33),
            fontWeight: fontWeight,
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
