import 'package:flutter/material.dart';
import '../../variables/global_variable.dart';

Container messageBar(BuildContext context, name, location, message, date) {
  return Container(
      margin: EdgeInsets.only(top: 30),
      child: Container(
        decoration: boxContainer,
        padding: EdgeInsets.only(top: 25, right: 30, bottom: 30, left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.chat, size: 16, color: Colors.blue.shade600),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Pesan dari ${name}",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade600),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${location}",
              style: TextStyle(fontSize: 14, color: Colors.black45),
            ),
            SizedBox(
              height: 17,
            ),
            Text(
              "\"${message}\"",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${date}",
              style: TextStyle(fontSize: 16, color: Colors.black45),
            )
          ],
        ),
      ));
}
