import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:ajousenior/data/post.dart';

class CommunityProviders {
  final uri = Uri.parse("http://54.180.8.70:4000/community/readall");

  Future<List<Post>> getPost() async {
    List<Post> entries = [];
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      // 만약 서버가 OK 응답을 반환하면, JSON을 파싱합니다.
      print(response.headers);
      final responseJson = json.decode(response.body);
      for (var posts in responseJson['data']) {
        final post = Post.fromJson(posts);
        print(post.title);
        entries.add(Post.fromJson(posts));
      }
      return entries;
      //return responseJson["data"].map((post) => Post.fromJson(post)).toList();
    } else {
      // 만약 응답이 OK가 아니면, 에러를 던집니다.
      throw Exception('Failed to load post');
    }
  }
}
