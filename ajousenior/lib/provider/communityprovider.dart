import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ajousenior/data/post.dart';

class CommunityProviders {
  Uri uri = Uri.parse("http://54.180.8.70:4000/community/readall");

  Future<List<Post>> getPost() async {
    List<Post> entries = [];
    print('ontest');
    final response = await http.get(uri);
    print(response.statusCode);
    if (response.statusCode == 200) {
      entries = jsonDecode(response.body).map<Post>((content) {
        return Post.fromMap(content);
      }).toList();
    }

    return entries;
  }
}
