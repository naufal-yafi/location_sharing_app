import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

onAlertButtonPressedError(context, title, desc) {
  Alert(
    context: context,
    type: AlertType.error,
    title: "${title}",
    desc: "${desc}",
    buttons: [
      DialogButton(
        child: Text(
          "OK",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => {Navigator.pop(context)},
        width: 120,
      )
    ],
  ).show();
}
