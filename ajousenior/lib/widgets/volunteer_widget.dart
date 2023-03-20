import 'package:ajousenior/screen/volunteer_screen.dart';
import 'package:flutter/material.dart';

class Volunteer extends StatelessWidget {
  const Volunteer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const VolunteerScreen(),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.yellow.withOpacity(0.9)),
        height: 150,
        width: 200,
        child: const Text(
          '봉사',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 50),
        ),
      ),
    );
  }
}
