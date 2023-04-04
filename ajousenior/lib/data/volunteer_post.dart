import 'package:intl/intl.dart';

class VolunteerPost {
  //final String title;
  final String place;
  final String date;
  final String userID;
  final String content;
  final int min;
  final int max;
  //final int members; //for test
  int members = 0;

  VolunteerPost({
    //required this.title,
    required this.place,
    required this.date,
    required this.userID,
    required this.content,
    required this.min,
    required this.max,
    //required this.members, //for test
  });
  factory VolunteerPost.fromJson(Map<String, dynamic>? map) {
    return VolunteerPost(
      place: map?['seniorcenter'] ?? '',
      content: map?['content'] ?? '',
      userID: map?['writer'] ?? '',
      date: DateFormat.yMMMd().format(DateTime.parse(map?['date'] ?? '')),
      min: 5,
      max: 30,
    );
  }
}

/*final List<VolunteerPost> entries = [
  VolunteerPost(
    title: '모집1',
    place: '수원경로당',
    date: '2023-03-25',
    min: 8,
    max: 30,
    members: 0,
  ),
  VolunteerPost(
    title: '모집2',
    place: '매탄경로당',
    date: '2023-03-25',
    min: 5,
    max: 30,
    members: 30,
  ),
  VolunteerPost(
    title: '모집3',
    place: '다른 장소',
    date: '2023-03-25',
    min: 3,
    max: 20,
    members: 20,
  ),
  VolunteerPost(
    title: '모집4',
    place: '어디',
    date: '2023-03-25',
    min: 5,
    max: 25,
    members: 12,
  ),
  VolunteerPost(
    title: '모집5',
    place: '어딘가',
    date: '2023-03-25',
    min: 6,
    max: 30,
    members: 15,
  ),
];*/
