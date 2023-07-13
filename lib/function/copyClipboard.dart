// ignore_for_file: file_names

import 'package:flutter/services.dart';

void copyToClipboard(String text) {
  Clipboard.setData(ClipboardData(text: text));
}
