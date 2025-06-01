import 'dart:convert';

import 'package:http/http.dart' as http;

class GetWithoutAuth {
  static Future get(String subUrl, {Map<String, String>? params}) async {
    try {
      final url = Uri.https("api.spoonacular.com", "recipes/$subUrl", {
        "apiKey": "87237ee4998c472c92bf215cd5705a17",
        ...?params,
      });
      print(url);
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
