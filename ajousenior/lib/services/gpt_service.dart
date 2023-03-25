import 'dart:convert';

import 'package:http/http.dart' as http;

String apiKey = "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";

class GptService {
  static String baseUrl = "https://api.openai.com";

  static Map<String, String> header = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey'
  };

  static sendMessage(String? message) async {
    var url = Uri.https("api.openai.com", "/v1/completions");
    var res = await http.post(
      url,
      headers: header,
      body: jsonEncode({
        "model": "text-davinci-003",
        "prompt": message,
        "max_tokens": 100,
        "temperature": 0.7
      }),
    );

    if (res.statusCode == 200) {
      Map<String, dynamic> msg = jsonDecode(utf8.decode(res.bodyBytes));
      msg['choices'][0]['text'];
      return msg['choices'][0]['text'];
    } else {
      print(res.body);
    }
  }
}
