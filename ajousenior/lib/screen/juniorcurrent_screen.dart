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
      backgroundColor: const Color.fromARGB(255, 237, 255, 240),
      body: CurrentList(),
    );
  }
}

class CurrentList extends StatelessWidget {
  final List<Color> colorList = [
    const Color.fromARGB(147, 94, 222, 102),
    const Color.fromARGB(200, 76, 181, 222),
    const Color.fromARGB(176, 218, 113, 113),
    const Color.fromARGB(255, 200, 255, 0),
    const Color.fromARGB(200, 174, 124, 207),
  ];
  CurrentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      /*padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 3,
      ),*/
      itemCount: testData.volunteerList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
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
                        width: 9.0, color: colorList[index % colorList.length]),
                  ),
                  color: Colors.white,
                  //borderRadius: BorderRadius.circular(1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7),
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
                        overflow: TextOverflow.ellipsis,
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
  }
}
