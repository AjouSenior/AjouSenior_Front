import 'package:ajousenior/widgets/juniorlogin_widget.dart';
import 'package:ajousenior/widgets/seniorlogin_widget.dart';
import 'package:flutter/material.dart';

class MainLogin extends StatelessWidget {
  const MainLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SeniorLogin(),
              JuniorLogin(),
            ],
          )
        ],
      ),
    );
  }
}
