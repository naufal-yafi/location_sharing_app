import 'package:flutter/material.dart';
import '../../variables/global_variable.dart';

Container informationBar(BuildContext context, location, name, date) {
  return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Container(
        decoration: boxContainer,
        padding:
            const EdgeInsets.only(top: 25, right: 30, bottom: 30, left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.assignment, size: 16, color: Colors.blue.shade600),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "informasi Kode",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade600),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "$location",
              style: const TextStyle(fontSize: 14, color: Colors.black45),
            ),
            const SizedBox(
              height: 17,
            ),
            const Text(
              "Nama Pengirim",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "$name",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              "Tanggal Dibuat",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "$date",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ));
}
