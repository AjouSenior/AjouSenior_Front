import 'package:flutter/material.dart';

class VolunteerPostScreen extends StatelessWidget {
  const VolunteerPostScreen({super.key});

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
      body: const Center(),
    );
  }
}
