import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vchatter/auth/presentation/ui/bloc/auth_bloc.dart';

class TextFieldEntry extends StatefulWidget {
  final TextEditingController controller;

  const TextFieldEntry({
    super.key,
    required this.controller,
  });

  @override
  State<TextFieldEntry> createState() => _TextFieldEntryState();
}

class _TextFieldEntryState extends State<TextFieldEntry> {
  bool isTickVisible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
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
        keyboardType: TextInputType.phone,
        obscureText: false,
        controller: widget.controller,
        style: const TextStyle(color: Colors.white70),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          fillColor: const Color.fromARGB(122, 84, 92, 120),
          filled: true,
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
          hintText: '10 Digit Phone number',
          prefixIcon: const Icon(Icons.phone),
          prefixIconColor: const Color.fromARGB(255, 18, 20, 39),
          suffixIconColor: Colors.white,
          suffixIconConstraints:
              const BoxConstraints.expand(height: 100, width: 50),
          suffixIcon: widget.controller.text.length == 10
              ? Container(
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.0),
                      color: Colors.green),
                  // padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                      onTap: () {
                        var phoneNumber = widget.controller.text.trim();
                        BlocProvider.of<AuthBloc>(context).add(
                            AuthSenOtptoPhoneEvent(
                                phoneNumber: "+91$phoneNumber"));
                      },
                      child: const Icon(Icons.arrow_forward)),
                )
              : null,
        ),
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }
}
