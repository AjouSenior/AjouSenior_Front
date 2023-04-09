import 'package:flutter/material.dart';
import 'package:ajousenior/data/juniorvolunteer.dart';

class CurrentScreen extends StatelessWidget {
  const CurrentScreen({super.key});

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
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: testData.volunteerList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testData
                        .volunteerList[
                            testData.volunteerList.length - index - 1]
                        .place,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    testData
                        .volunteerList[
                            testData.volunteerList.length - index - 1]
                        .userID,
                  ),
                  Text(
                    testData
                        .volunteerList[
                            testData.volunteerList.length - index - 1]
                        .date,
                  ),
                  Text(
                    testData
                        .volunteerList[
                            testData.volunteerList.length - index - 1]
                        .content,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
