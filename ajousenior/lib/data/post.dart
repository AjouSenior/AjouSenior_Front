import 'package:intl/intl.dart';

class Post {
  late String title;
  late String content;
  late String date;
  late String userID;
//  List<Comment> comments = [];

  Post({
    required this.title,
    required this.content,
    required this.date,
    required this.userID,
    //this.comments,
  });

<<<<<<< HEAD
  Post.fromMap(Map<String, dynamic>? map) {
    title = map?['title'] ?? '';
    content = map?['content'] ?? '';
    userID = map?['writer'] ?? '';
    DateTime dateTime = map?['date'] ?? '';
    date = DateFormat.yMMMd().format(dateTime);
=======
  void addComment(Comment comment) {
    comments.add(comment);
>>>>>>> ee0713436727a405c81bcaf9f5b39285c161d3f2
  }
}
/*
class Comment {
  final String userID;
  final String comment;
  final String date;

  Comment({
    required this.userID,
    required this.comment,
    required this.date,
  });
}

//test data
final List<Post> entries = [
  Post(
    title: 'Title1',
    content: 'context1 abababaabababab',
    date: '2023-03-23',
    userID: 'user1',
  ),
  Post(
    title: 'Title2',
    content: 'context2 cdcdcdcdcdcdcdcd',
    date: '2023-03-23',
    userID: 'user2',
  ),
  Post(
    title: 'Title3',
    content: 'context3 efefeefefefefefef',
    date: '2023-03-23',
    userID: 'user3',
  ),
  Post(
    title: 'Title4',
    content: 'context4 ghghghghghghghghgh',
    date: '2023-03-23',
    userID: 'user4',
  ),
];

final List<Comment> comments1 = [
  Comment(userID: 'user2', comment: 'commentabcabc', date: '2023-03-25'),
  Comment(userID: 'user4', comment: 'commentabcdef', date: '2023-03-25'),
  Comment(userID: 'user7', comment: 'commentabcddd', date: '2023-03-26'),
];
*/