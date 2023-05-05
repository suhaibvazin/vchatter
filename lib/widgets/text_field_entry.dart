import 'package:flutter/material.dart';

class TextFieldEntry extends StatelessWidget {
  final String label;
  final Icon? icon;
  final String? Function(String?)? validator;
  const TextFieldEntry({
    super.key,
    this.validator,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: icon,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: label,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, strokeAlign: 1, color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            strokeAlign: 1,
            color: Color.fromARGB(255, 3, 12, 71),
          ),
        ),
      ),
    );
  }
}
