import 'dart:convert';
import 'package:http/http.dart' as http;

class JuniorVolunList {
  static juniorVolunlist(String? userId) async {
    var url = Uri.http("54.180.8.70:4000", "/junior/findtalentdonationhope");
    var res = await http.post(
      url,
      body: {
        "userid": userId,
      },
    );

    if (res.statusCode == 200) {
      var msg = jsonDecode((res.body));
      print(msg);
      return msg;
    } else {
      print(res.body);
      throw (e) {
        print(e);
      };
    }
  }
}
