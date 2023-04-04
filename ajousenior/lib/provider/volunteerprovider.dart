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
      print(response.body);
      final responseJson = json.decode(response.body);
      for (var posts in responseJson['data']) {
        entries.add(VolunteerPost.fromJson(posts));
      }
      return entries;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
