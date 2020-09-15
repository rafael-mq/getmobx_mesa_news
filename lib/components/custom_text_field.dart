// Widget _textField({String label, Function onChanged, bool obscure: false}) {
//     return TextField(
//       obscureText: obscure,
//       onChanged: onChanged,
//       decoration: InputDecoration(
//           border: InputBorder.none,
//           labelText: label,
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           filled: true,
//           fillColor: Color(0xFFF0F0F0)),
//     );
//   }

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool obscure;
  final String label;
  final void Function(String) onChanged;

  CustomTextField({this.obscure: false, this.label, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      onChanged: onChanged,
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: Color(0xFFF0F0F0)),
    );
  }
}
