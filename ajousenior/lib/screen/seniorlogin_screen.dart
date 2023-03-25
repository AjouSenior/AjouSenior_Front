import 'package:ajousenior/widgets/seniorkakao_widget.dart';
import 'package:flutter/material.dart';

class SeniorLoginScreen extends StatelessWidget {
  const SeniorLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [SeniorKakao()],
      ),
    );
  }
}
