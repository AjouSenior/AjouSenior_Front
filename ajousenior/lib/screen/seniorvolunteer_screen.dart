import 'package:ajousenior/data/volunteer_post.dart';
import 'package:ajousenior/screen/seniorvolunteer_myscreen.dart';
import 'package:ajousenior/screen/volunteer_content_screen.dart';
import 'package:ajousenior/screen/volunteer_post_screen.dart';
import 'package:ajousenior/widgets/volunteer_onrecruit_widget.dart';
import 'package:ajousenior/provider/volunteerprovider.dart';
import 'package:flutter/material.dart';

class SeniorVolunteerScreen extends StatefulWidget {
  const SeniorVolunteerScreen({super.key});
  @override
  State<SeniorVolunteerScreen> createState() => _SeniorVolunteerScreenState();
}

class _SeniorVolunteerScreenState extends State<SeniorVolunteerScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('재능기부 선택'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.verified_user_outlined),
              onPressed: () {
                // 아이콘 버튼 실행
              },
            ),
            IconButton(
              icon: const Icon(Icons.verified_user_outlined), // 검색 아이콘 생성
              onPressed: () {
                // 아이콘 버튼 실행
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SeniorMyScreen(),
                  ),
                );
              },
            ),
          ]),
      body: FutureBuilder<List<VolunteerPost>>(
        future: VolunteerProviders().getPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VolunteerContentScreen(
                            current: snapshot
                                .data![snapshot.data!.length - index - 1]),
                      ),
                    ).then((value) {});
                  },
                  title: Container(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    height: 130,
                    width: double.maxFinite,
                    child: Card(
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              width: 9.0,
                              color: snapshot
                                          .data![
                                              snapshot.data!.length - index - 1]
                                          .members >=
                                      snapshot
                                          .data![
                                              snapshot.data!.length - index - 1]
                                          .max
                                  ? Colors.red
                                  : Colors.green,
                            ),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            snapshot
                                                .data![snapshot.data!.length -
                                                    index -
                                                    1]
                                                .content,
                                            style: const TextStyle(
                                              fontSize: 20,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  OnRecruit(
                                    full: snapshot
                                            .data![snapshot.data!.length -
                                                index -
                                                1]
                                            .members >=
                                        snapshot
                                            .data![snapshot.data!.length -
                                                index -
                                                1]
                                            .max,
                                  ),
                                ],
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              Text(
                                snapshot
                                    .data![snapshot.data!.length - index - 1]
                                    .place,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                snapshot
                                    .data![snapshot.data!.length - index - 1]
                                    .date,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              Text(
                                '신청 / 최대인원 : ${snapshot.data![snapshot.data!.length - index - 1].members} / ${snapshot.data![snapshot.data!.length - index - 1].max}',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VolunteerPostScreen(),
            ),
          ).then((value) {
            setState(() {});
          });
        },
        tooltip: 'Post',
        child: const Icon(Icons.add),
      ),
    );
  }
}
