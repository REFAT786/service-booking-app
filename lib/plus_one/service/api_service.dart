import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static const String baseUrl = "http://10.0.70.112:8010/api/v1";

  Future<Map<String, dynamic>> get(String endpoint) async {

    final url = Uri.parse("$baseUrl/$endpoint");
    try {
      final response = await http.get(
        url,
      );
      return _processResponse(response);
    } catch (e) {
      throw Exception("Request failed: $e");
    }
  }

  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body, {String? token}) async {
    final url = Uri.parse("$baseUrl/$endpoint");
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        if (token != null) "token": token,
        if (token != null) "Authorization": token
      },
      body: json.encode(body),
    );

    return _processResponse(response);
  }

  Future<Map<String, dynamic>> patch(String endpoint, Map<String, dynamic> body, {String? token}) async {
    final url = Uri.parse("$baseUrl/$endpoint");
    final response = await http.patch(
      url,
      headers: {
        "Content-Type": "application/json",
        if (token != null) "token": token,
        if (token != null) "Authorization": token
      },
      body: json.encode(body),
    );
    return _processResponse(response);
  }


  Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception("Error: ${response.statusCode}, ${response.body}");
    }
  }


}
