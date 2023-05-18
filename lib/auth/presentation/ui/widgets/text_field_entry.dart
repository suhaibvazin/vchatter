import 'package:flutter/material.dart';

class TextFieldEntry extends StatelessWidget {
  final String label;
  final Icon? icon;
  final TextEditingController controller;
  const TextFieldEntry({
    super.key,
    required this.label,
    this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0)
                .withOpacity(0.9), // Set shadow color
            spreadRadius: 1.0,
            blurRadius: 12.0,
            offset: const Offset(0, 0), // Offset of the shadow
          ),
        ],
      ),
      child: TextFormField(
        autocorrect: false,
        keyboardType:
            label == 'Email' ? TextInputType.emailAddress : TextInputType.text,
        obscureText: label == 'Password' ? true : false,
        controller: controller,
        style: const TextStyle(color: Colors.white70),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 7),
          border: InputBorder.none,
          fillColor: const Color.fromARGB(122, 84, 92, 120),
          filled: true,
          prefixIcon: icon,
          prefixIconColor: const Color.fromARGB(255, 84, 92, 120),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
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
        ),
      ),
    );
  }
}
