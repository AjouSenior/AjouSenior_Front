import 'dart:convert';
import 'package:http/http.dart' as http;

class CertifyService {
  var url = Uri.parse("http://54.180.8.70:4000/senior/talentdonationconfirm");
  certify(String donationid, String userid) async {
    var data = {"donationid": donationid, "userid": userid};
    var body = json.encode(data);
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      print('certify');
    } else {
      throw Exception('fail');
    }
  }
}
