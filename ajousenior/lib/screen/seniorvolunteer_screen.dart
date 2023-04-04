import 'package:ajousenior/data/volunteer_post.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Center(
          child: Text(
            "Senior App",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
        ),
      ),
      body: FutureBuilder<List<VolunteerPost>>(
        future: VolunteerProviders().getPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VolunteerContentScreen(
                            current: snapshot.data![index]),
                      ),
                    );
                  },
                  title: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    height: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  snapshot.data![index].content,
                                  style: const TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                            OnRecruit(
                              full: snapshot.data![index].members >=
                                  snapshot.data![index].max,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          snapshot.data![index].place,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        Text(
                          snapshot.data![index].date,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        Text(
                          '신청 / 최대인원 : ${snapshot.data![index].members} / ${snapshot.data![index].max}',
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            );
          } else if (snapshot.hasError) {
            Text('${snapshot.error}');
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
          );
        },
        tooltip: 'Post',
        child: const Icon(Icons.add),
      ),
    );
  }
}
