import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiAPI {
  static Future<Map<String, String>> getHeader() async {
    return {
      'Content-Type': 'application/json',
    };
  }
  static Future<String> getGeminiData(message) async {
    try {
      String apiKey = 'AIzaSyAszBSOAx8TCxbC5yTNffGr2d86l8JmV74'; //put your api Key here
      final header = await getHeader();

      final Map<String, dynamic> requestBody = {
        'contents': [
          {
            'parts': [
              {
                'text': message,
              }
            ]
          }
        ],
        'generationConfig': {
          'temperature': 0.8, 
          'maxOutputTokens': 1000 
        }
      };

      String url =
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey';
      
      var response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(requestBody),
      );

      print(response.body); //to fix if theres any error check logs

      if (response.statusCode == 200) {
       
        var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        return jsonResponse['candidates'][0]['content']['parts'][0]['text'];
       
      } else {
        return '';
      }
    } catch (e) {
      print("Error: $e");
      return '';
    }
  }
}