// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<List> getData() async {
  await dotenv.load();

  final response = await http.get(
    Uri.parse("${dotenv.env['API_BASE_URL']}/${dotenv.env['API_END_POINT']}"),
  );

  List<Map<String, dynamic>> data =
      List<Map<String, dynamic>>.from(json.decode(response.body));
  data.sort((a, b) => int.parse(b['id']).compareTo(int.parse(a['id'])));

  return data;
}
