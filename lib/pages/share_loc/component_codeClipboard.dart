// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../variables/global_variable.dart';
import '../../function/copyClipboard.dart';
import '../../components/errorAlert.dart';
import '../../components/successAlert.dart';

Container copyCode(BuildContext context, locationaddress, code) {
  return Container(
      margin: const EdgeInsets.only(top: 35),
      child: Container(
        decoration: boxContainer,
        padding:
            const EdgeInsets.only(top: 25, right: 30, bottom: 30, left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Kirimkan Kode Dibawah ke Temanmu.",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(
              height: 14,
            ),
            Text("$code",
                style: const TextStyle(fontSize: 13, color: Colors.black45)),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton.icon(
              style: customButtonStyle,
              label: Text(
                "Copy to Clipboard",
                style: TextStyle(
                  color: Colors.blue.shade600,
                ),
              ),
              icon: Icon(Icons.copy, color: Colors.blue.shade600, size: 16),
              onPressed: () {
                if (locationaddress == "Belum Ditentukan") {
                  onAlertButtonPressedError(
                      context,
                      "Belum ada lokasi yang dikirim",
                      "Tentukan lokasi dan share lokasi.");
                } else {
                  copyToClipboard("$code");
                  onAlertButtonPressedSuccess(
                      context, "Berhasil Disalin", "$code");
                }
              },
            ),
          ],
        ),
      ));
}
