import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  const MyCheckBox({super.key});

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  List<Map> items = [
    {'name': 'USA', 'isChecked': false},
    {'name': 'CAN', 'isChecked': false},
    {'name': 'MEX', 'isChecked': true},
  ];
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
        children: items.map(
          (favorite) {
            return CheckboxListTile(
                title: Text(favorite['name']),
                value: favorite['isChecked'],
                onChanged: (val) {
                  setState(() {
                    favorite['isChecked'] = val;
                  });
                });
          },
        ).toList(),
      ),
    );
  }
}
