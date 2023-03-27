import 'package:ajousenior/data/post.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  final titlearea = TextEditingController();
  final contentarea = TextEditingController();

  PostScreen({super.key});

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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titlearea,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Title',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: contentarea,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Post newPost = Post(
                      title: titlearea.text,
                      content: contentarea.text,
                      date: '2023-03-26',
                      userID: 'user1',
                    );
                    entries.insert(0, newPost);
                    Navigator.pop(context);
                  },
                  child: const Text("post"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
