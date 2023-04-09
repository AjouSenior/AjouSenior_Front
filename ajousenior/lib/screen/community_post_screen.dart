import 'package:ajousenior/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

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
            AdvancedTextField(
              controller: titlearea,
              labelText: 'Title',
              hintText: 'Title',
            ),
            const SizedBox(
              height: 10,
            ),
            AdvancedTextField(
              controller: contentarea,
              multiline: true,
              maxLines: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    var data = {
                      "title": titlearea.text,
                      "content": contentarea.text,
                      "writer": 'user1',
                      "date": DateFormat.yMMMd().format(DateTime.now()),
                    };
                    var body = json.encode(data);
                    http.Response res = await http.post(
                      Uri.parse("http://54.180.8.70:4000/community/upload"),
                      headers: {"Content-Type": "application/json"},
                      body: body,
                    );
                    print(body);
                    if (res.statusCode == 200) {
                      Navigator.pop(context);
                    } else {
                      throw Exception('post failed');
                    }
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
