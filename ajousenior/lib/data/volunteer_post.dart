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
    required this.members, //for test
  });
  factory VolunteerPost.fromJson(Map<String, dynamic>? map) {
    return VolunteerPost(
      place: map?['seniorcenter'] ?? '',
      content: map?['content'] ?? '',
      userID: map?['writer'] ?? '',
      date: DateFormat.yMMMd().format(DateTime.parse(map?['date'] ?? '')),
      min: 5,
      max: map?['maxpeople'] ?? 30,
      members: map?['currentpeople'] ?? 0,
    );
  }
}

final List<VolunteerPost> entries = [
  VolunteerPost(
    content: '어디서 뭐할사람 모집합니다',
    place: '수원경로당',
    date: '2023-03-25',
    userID: 'user1',
    min: 8,
    max: 30,
    members: 0,
  ),
  VolunteerPost(
    content: '봉사 인원 모집합니다',
    place: '매탄경로당',
    date: '2023-03-25',
    userID: 'user2',
    min: 5,
    max: 30,
    members: 30,
  ),
  VolunteerPost(
    content: '심심해요 와주세요',
    place: '다른 장소',
    date: '2023-03-25',
    userID: 'user3',
    min: 3,
    max: 20,
    members: 20,
  ),
  VolunteerPost(
    content: '하나둘셋넷다섯여섯일곱여덟',
    place: '어디경로당',
    date: '2023-03-25',
    userID: 'user4',
    min: 5,
    max: 25,
    members: 12,
  ),
  VolunteerPost(
    content: '모집5',
    place: '어디노인복지센터',
    date: '2023-03-25',
    userID: 'user5',
    min: 6,
    max: 30,
    members: 15,
  ),
];
