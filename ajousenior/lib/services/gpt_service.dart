import 'dart:convert';

import 'package:http/http.dart' as http;

String apiKey = "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";

class GptService {
  static String baseUrl = "https://api.openai.com/v1/completions";

  static Map<String, String> header = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey'
  };

  static sendMessage(String? message) async {
    var res = await http.post(
      Uri.parse(baseUrl),
      headers: header,
      body: jsonEncode({
        "model": "text-davinci-003",
        "promt": '$message',
        "temperature": 0,
        "max_token": 100,
        "top_p": 1,
        "frequency_penalty": 0.0,
        "presence_penalty": 0.0,
        "stop": [" Human:", "AI:"]
      }),
    );

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());
      var msg = data['choices'][0]['text'];
      return msg;
    } else {
      print('failed to fetch data');
    }
  }
}