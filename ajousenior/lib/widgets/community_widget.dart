import 'package:ajousenior/screen/community_screen.dart';
import 'package:flutter/material.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CommunityScreen(),
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
          '커뮤니티',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 50),
        ),
      ),
    );
  }
}
