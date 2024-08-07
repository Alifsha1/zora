import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostCustomTexTField extends StatelessWidget {
  final Widget? prefix;
  final String hint;
  final int? maxline;
  void Function()? onTap;
  void Function(String)? onChanged;
  void Function(String)? onFieldSubmitted;
   PostCustomTexTField({
    super.key,
    required this.controller,
    this.prefix,
    required this.hint,
    this.maxline,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
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
