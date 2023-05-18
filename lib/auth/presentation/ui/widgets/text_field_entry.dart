import 'package:flutter/material.dart';

class TextFieldEntry extends StatelessWidget {
  final String label;
  final Icon? icon;
  final TextEditingController controller;
  final IconButton? suffixIconButton;

  const TextFieldEntry({
    super.key,
    required this.label,
    this.icon,
    required this.controller,
    this.suffixIconButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0)
                .withOpacity(0.3), // Set shadow color
            spreadRadius: 1.0,
            blurRadius: 5.0,
            offset: const Offset(0, 1), // Offset of the shadow
          ),
        ],
      ),
      child: TextFormField(
        autocorrect: false,
        keyboardType:
            label == 'Email' ? TextInputType.text : TextInputType.phone,
        obscureText: label == 'Password' ? true : false,
        controller: controller,
        style: const TextStyle(color: Colors.white70),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 7),
            fillColor: const Color.fromARGB(122, 84, 92, 120),
            filled: true,
            prefixIcon: icon,
            prefixIconColor: const Color.fromARGB(255, 84, 92, 120),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(width: 0)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                width: 2,
                strokeAlign: 1,
                color: Colors.grey,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            label: Text(
              label,
              style: const TextStyle(
                  fontFamily: 'product sans',
                  color: Color.fromARGB(255, 131, 144, 191),
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            suffixIcon: suffixIconButton),
      ),
    );
  }
}
