import 'package:flutter/material.dart';

Container card(BuildContext context, title, desc, command, dark, Icon icon) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: dark ? Colors.black87 : Colors.blue.shade50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                icon,
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "$title",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: dark ? Colors.white : Colors.blue.shade600),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "$desc",
              style: TextStyle(
                  color: dark ? Colors.white60 : Colors.blue.shade400,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "$command",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: dark ? Colors.white : Colors.blue.shade600),
                ),
                const SizedBox(
                  width: 9,
                ),
                Icon(Icons.arrow_right_alt,
                    color: dark ? Colors.white : Colors.blue.shade600)
              ],
            )
          ],
        ),
      ));
}
