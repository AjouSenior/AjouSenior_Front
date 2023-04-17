import 'package:ajousenior/data/volunteer_post.dart';
import 'package:flutter/material.dart';

class VolunteerContentScreen extends StatelessWidget {
  final VolunteerPost current;
  const VolunteerContentScreen({
    super.key,
    required this.current,
  });

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
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              current.content,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${current.members} / ${current.max}',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              current.date,
            ),
          ],
        ),
      ),
    );
  }
}
