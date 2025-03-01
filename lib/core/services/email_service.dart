import 'dart:convert';

import 'package:http/http.dart' as http;

class EmailService {
  static Future sendMessage(String message) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Cookie': 'fs_ab1=control'
    };
    String body = jsonEncode({
      "email": "revelationjay02@gmail.com",
      "message": message,
    });
    var response = await http.post(
      Uri.parse('https://formspree.io/f/mbldnooo'),
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      throw "Failed to send message";
    }
  }
}
