import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/senior_model.dart';
import '../services/junior_volunteerlist.dart';

class CurrentScreen extends StatefulWidget {
  const CurrentScreen({super.key});

  @override
  State<CurrentScreen> createState() => _CurrentScreenState();
}

class _CurrentScreenState extends State<CurrentScreen> {
  final List<Color> colorList = [
    const Color.fromARGB(147, 94, 222, 102),
    const Color.fromARGB(200, 76, 181, 222),
    const Color.fromARGB(176, 218, 113, 113),
    const Color.fromARGB(255, 200, 255, 0),
    const Color.fromARGB(200, 174, 124, 207),
  ];

  static const storage = FlutterSecureStorage();
  dynamic userInfo = '';
  // storage에 있는 유저 정보를 저장

  _asyncMethod() async {
    // read 함수로 key값에 맞는 정보를 불러오고 데이터타입은 String 타입
    userInfo = await storage.read(key: 'login');
    print(userInfo + "를 읽어왔습니다");
    setState(() {}); // userInfo가 업데이트 되었으므로 setState() 호출
  }

  List<Map<String, dynamic>> locations = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          title: const Center(
            child: Text(
              "Junior App",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 237, 255, 240),
        body: userInfo.isEmpty // userInfo가 비어있는 경우
            ? const Center(child: CircularProgressIndicator()) // 로딩 중 표시
            : FutureBuilder<List<Map<String, dynamic>>>(
                future: JuniorVolunList.juniorVolunlist(StringTo(userInfo).id),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final volunteerList = snapshot.data!;

                  return ListView.builder(
                    itemCount: volunteerList.length,
                    itemBuilder: (context, index) {
                      final place =
                          volunteerList[volunteerList.length - index - 1]
                              ['place'];
                      final date =
                          volunteerList[volunteerList.length - index - 1]
                              ['date'];

                      return ListTile(
                        title: Text(
                          place,
                          style: const TextStyle(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(date),
                        onTap: () {
                          // TODO: 리스트 탭 시 동작
                        },
                      );
                    },
                  );
                },
              ));
  }
}

        //
        //
        //
        // ListView.builder(
        //   itemCount: Volunteer.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return ListTile(
        //       title: Container(
        //         padding: const EdgeInsets.symmetric(vertical: 2),
        //         height: 130,
        //         width: double.maxFinite,
        //         child: Card(
        //           elevation: 5,
        //           child: Container(
        //             decoration: BoxDecoration(
        //               border: Border(
        //                 left: BorderSide(
        //                   width: 9.0,
        //                   color: colorList[index % colorList.length],
        //                 ),
        //               ),
        //               color: Colors.white,
        //             ),
        //             child: Padding(
        //               padding: const EdgeInsets.all(7),
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     testData
        //                         .volunteerList[
        //                             testData.volunteerList.length - index - 1]
        //                         .place, //장소
        //                     style: const TextStyle(
        //                       fontSize: 20,
        //                     ),
        //                     overflow: TextOverflow.ellipsis,
        //                   ),
        //                   const SizedBox(
        //                     height: 5,
        //                   ),
        //                   Text(
        //                     testData
        //                         .volunteerList[
        //                             testData.volunteerList.length - index - 1]
        //                         .userID, //날짜
        //                   ),
        //                   Text(
        //                     testData
        //                         .volunteerList[
        //                             testData.volunteerList.length - index - 1]
        //                         .date, //내용
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),

