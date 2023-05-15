import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:ajousenior/data/volunteer_post.dart';

class VolunteerProviders {
  final uri = Uri.parse("http://54.180.8.70:4000/talentdonation/readall");
  Future<List<VolunteerPost>> getPost() async {
    List<VolunteerPost> entries = [];
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      for (var posts in responseJson['data']) {
        entries.add(VolunteerPost.fromJson(posts));
      }
      //print(entries[0].members);
      return entries;
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<List<VolunteerPost>> getmyPost(String? username) async {
    var url = Uri.http("54.180.8.70:4000", "/senior/mytalentdonation");
    List<VolunteerPost> entries = [];
    final response = await http.post(
      url,
      body: {"username": username},
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      for (var posts in responseJson['data']) {
        entries.add(VolunteerPost.fromJson(posts));
      }
      print(entries[0].members);
      return entries;
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<List<String>> getList(String donationID) async {
    final url =
        Uri.parse("http://54.180.8.70:4000/senior/findtalentdonationhope");
    List<String> entries = [];
    var data = {"donationid": donationID};
    var body = json.encode(data);
    print('aaa');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    print(json.decode(response.body)["data"]);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      for (dynamic users in responseJson['data']) {
        print(users[0]["profile_nickname"]);
        entries.add(users[0]["profile_nickname"]);
      }
      return entries;
    } else {
      throw Exception('Failed to load list');
    }
  }
}
