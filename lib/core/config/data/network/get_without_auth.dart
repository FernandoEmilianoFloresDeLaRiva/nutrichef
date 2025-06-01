import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GetWithoutAuth {
  final apiUrl = dotenv.env['API_URL'] ?? "";
  final apiKey = dotenv.env['API_KEY'] ?? "";
  Future get(String subUrl, {Map<String, String>? params}) async {
    try {
      final url = Uri.https(apiUrl, "recipes/$subUrl", {
        "apiKey": apiKey,
        ...?params,
      });
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
