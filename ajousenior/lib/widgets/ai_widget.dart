import 'package:ajousenior/screen/ai_screen.dart';
import 'package:flutter/material.dart';

class Ai extends StatelessWidget {
  const Ai({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AiScreen(),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        height: 150,
        width: 200,
        child: const Text(
          'AI',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 50),
        ),
      ),
    );
  }
}
