import 'package:flutter/material.dart';

class PostCustomTexTField extends StatelessWidget {
  final Widget? prefix;
  final String hint;
  final int? maxline;
  const PostCustomTexTField({
    super.key,
    required this.controller,
    this.prefix,
    required this.hint,
    this.maxline,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline ?? 1,
      controller: controller,
      // validator: validator,
      cursorColor: Colors.black,
      decoration: InputDecoration(
       
        hintText: hint,
        // suffix: suffix,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        //suffixIcon: Icon(icons),
        prefixIcon: prefix,
        border: InputBorder.none,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 127, 162, 194),
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 244, 255, 255),
      ),
    );
  }
}
