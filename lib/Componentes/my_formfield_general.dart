import 'package:flutter/material.dart';

class textFormFieldGeneral extends StatelessWidget {
  final String labelTxt;
  final String hintText;
  final Function onChanged;
  final IconData icon;
  const textFormFieldGeneral({
    required this.labelTxt,
    required this.hintText,
    required this.onChanged,
    this.icon = Icons.text_format_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: TextFormField(
        minLines: 2,
        maxLines: 10,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromARGB(255, 204, 204, 204),
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
          fillColor: Color.fromARGB(255, 204, 204, 204),
          filled: true,
          prefixIcon: Icon(icon),
          labelText: labelTxt,
          hintText: hintText,
          hintStyle: TextStyle(
            //fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
          labelStyle: TextStyle(
            //fontFamily: 'Montserrat',
            color: Color.fromARGB(255, 33, 33, 33),
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
