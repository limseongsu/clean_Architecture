import 'dart:convert';

import 'package:http/http.dart' as http;


class PixabayApi {
  PixabayApi(this.client);
  final http.Client client;
  final baseUrl = "https://pixabay.com/api/";
  final key = "25793617-413b7cf6fcf543b1c82bc9d30";

  Future<List> fetch(String query) async {
     final response = await client
        .get(Uri.parse("$baseUrl?key=$key&q=$query&image_type=photo"));
     Map<String, dynamic> jsonResponse = json.decode(response.body);
     final List hits = jsonResponse["hits"];
     return hits;
  }
}