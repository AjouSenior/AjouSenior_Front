import 'package:ajousenior/data/volunteer_post.dart';
import 'package:ajousenior/screen/volunteer_content_screen.dart';
import 'package:ajousenior/screen/volunteer_post_screen.dart';
import 'package:ajousenior/widgets/volunteer_onrecruit_widget.dart';
import 'package:flutter/material.dart';

class SeniorVolunteerScreen extends StatelessWidget {
  const SeniorVolunteerScreen({super.key});

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
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      VolunteerContentScreen(current: entries[index]),
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
                            entries[index].title,
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      OnRecruit(
                        full: entries[index].members >= entries[index].max,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    entries[index].place,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    entries[index].date,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    '신청 / 최대인원 : ${entries[index].members} / ${entries[index].max}',
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
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
