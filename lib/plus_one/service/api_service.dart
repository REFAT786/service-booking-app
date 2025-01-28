import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:service_booking_app/utils/app_url.dart';

class ApiService {

  Future<Map<String, dynamic>> get(String endpoint, {String? token}) async {

    final url = Uri.parse("${AppUrl.baseUrl}/$endpoint");
    try {
      final response = await http.get(
        url,
        headers: {
          if (token != null) "token": token,
          if (token != null) "Authorization": token,
        },
      );
      return _processResponse(response);
    } catch (e) {
      throw Exception("Request failed: $e");
    }
  }

  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body, {String? token}) async {
    final url = Uri.parse("${AppUrl.baseUrl}/$endpoint");
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
    final url = Uri.parse("${AppUrl.baseUrl}/$endpoint");
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


  Future<Map<String, dynamic>> multipartPatch(
      String endpoint, {
        required Map<String, String> fields,
        required List<http.MultipartFile> files,
        String? token,
      }) async {
    final url = Uri.parse("${AppUrl.baseUrl}/$endpoint");
    try {
      final request = http.MultipartRequest('PATCH', url);
      if (token != null) {
        request.headers['token'] = token;
      }
      if (token != null) {
        request.headers['Authorization'] = token;
      }
      request.fields.addAll(fields);
      request.files.addAll(files);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      return _processResponse(response);
    } catch (e) {
      throw Exception("Multipart PATCH request failed: $e");
    }
  }


  Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception("Error: ${response.statusCode}, ${response.body}");
    }
  }


}
