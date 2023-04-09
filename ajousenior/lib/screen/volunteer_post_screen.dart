import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:ajousenior/widgets/textfield_widget.dart';
import 'package:http/http.dart' as http;

class VolunteerPostScreen extends StatefulWidget {
  const VolunteerPostScreen({super.key});
  @override
  State<VolunteerPostScreen> createState() => _VolunteerPostScreenState();
}

class _VolunteerPostScreenState extends State<VolunteerPostScreen> {
  final centerarea = TextEditingController();
  final contentarea = TextEditingController();
  final memberarea = TextEditingController();
  DateTime date = DateTime.now();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdvancedTextField(
              controller: contentarea,
              labelText: 'content',
              hintText: 'content',
            ),
            const SizedBox(
              height: 10,
            ),
            AdvancedTextField(
              controller: centerarea,
              labelText: 'seniorcenter',
              hintText: 'seniorcenter',
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
              ],
              controller: memberarea,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'members',
                hintText: 'members',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Date',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2099),
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                    );
                    if (selectedDate != null) {
                      setState(() {
                        date = selectedDate;
                      });
                    }
                  },
                  child: const Text('select'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    /*Post newPost = Post(
                      title: titlearea.text,
                      content: contentarea.text,
                      date: '2023-03-26',
                      userID: 'user1',
                    );
                    posts.insert(0, newPost);
                    Navigator.pop(context);*/
                    var data = {
                      "seniorcenter": centerarea.text,
                      "writer": "user1",
                      "date": DateFormat.yMMMd().format(date),
                      "content": contentarea.text,
                      "maxpeople": int.tryParse(memberarea.text),
                      "currentpeople": 0
                    };
                    var body = json.encode(data);
                    http.Response res = await http.post(
                      Uri.parse(
                          "http://54.180.8.70:4000/talentdonation/upload"),
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
