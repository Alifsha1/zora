import 'package:flutter/material.dart';

class Textformfieldlog extends StatelessWidget {
  final TextEditingController controller;
  final IconData? icons;
  final String hint;
  final  Widget? suffix;
   final String? Function(String?)? validator;
  const Textformfieldlog({super.key, required this.hint, this.icons, required this.controller, this.validator, this.suffix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator:validator ,
      
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffix: suffix,
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        suffixIcon: Icon(icons),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: Color.fromARGB(255, 127, 162, 194),
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 244, 255, 255),
      ),
    );
  }
}
