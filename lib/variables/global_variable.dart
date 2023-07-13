import 'package:flutter/material.dart';

BoxDecoration boxContainer = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(15),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.25),
      spreadRadius: 0,
      blurRadius: 25,
      offset: const Offset(0, 4), // mengatur posisi bayangan
    ),
  ],
);

InputDecoration borderInput(text) => InputDecoration(
      hintText: "$text",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
            8.0), // Sesuaikan dengan radius yang diinginkan
        borderSide: const BorderSide(
            color: Colors.white12), // Ubah warna border sesuai kebutuhan
      ),
      filled: true,
      fillColor: Colors.white,
    );

ButtonStyle customButtonStyle = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
    const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0), // Atur ukuran padding sesuai kebutuhan
  ),
  elevation: MaterialStateProperty.all<double>(0),
  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade50),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(8.0), // Sesuaikan dengan radius yang diinginkan
    ),
  ),
);
