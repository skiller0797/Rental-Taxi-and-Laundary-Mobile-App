import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatelessWidget {
  final String value;
  final List<String> items;
  final void Function(String?) onChanged;

  const DropdownButtonWidget(
      {super.key,
      required this.value,
      required this.items,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: Colors.black, fontSize: 10),
      // underline: Container(
      //   height: 2,
      //   color: Colors.green,
      // ),
      hint: const Text("Select discount"),
      dropdownColor: Colors.white,
      iconEnabledColor: Colors.black,
    );
  }
}
