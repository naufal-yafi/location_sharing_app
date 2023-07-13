// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<List<Map<String, dynamic>>> getData() async {
  await dotenv.load();

  final response = await http.get(Uri.parse(
      "${dotenv.env['API_BASE_URL']}/${dotenv.env['API_END_POINT']}"));
  List<dynamic> data = json.decode(response.body);

  return List<Map<String, dynamic>>.from(data);
}
