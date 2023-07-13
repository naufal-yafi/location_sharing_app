import 'package:flutter/material.dart';
import '../../function/copyClipboard.dart';
import '../../components/successAlert.dart';

Container bar(BuildContext context, code, date) {
  return Container(
    padding: EdgeInsets.only(top: 5, left: 5, right: 5),
    child: GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${code}"),
          leading: Icon(Icons.map_sharp, color: Colors.blue.shade600),
          subtitle: Text("\n${date}"),
          trailing: Icon(Icons.copy),
        ),
      ),
      onTap: () => {
        copyToClipboard("${code}"),
        onAlertButtonPressedSuccess(context, "Berhasil Dicopy", "${code}")
      },
    ),
  );
}
