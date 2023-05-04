import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              height: 130,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 9.0,
                        color: Colors.black,
                      ),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Row(
                      children: [
                        Container(
                          width: 95,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 80,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'test',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            /*const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'test',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),*/
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
