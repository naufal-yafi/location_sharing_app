// ignore_for_file: file_names

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

void addData(
    latitude, longitude, code, datetime, locationaddress, name, message) async {
  await dotenv.load();

  var url =
      Uri.parse("${dotenv.env['API_BASE_URL']}/${dotenv.env['API_END_POINT']}");

  http.post(url, body: {
    "latitude": "$latitude",
    "longitude": "$longitude",
    "code": "$code",
    "date": "$datetime",
    "location": "$locationaddress",
    "name": "$name",
    "message": "$message"
  });
}
