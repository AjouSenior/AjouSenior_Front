import 'package:ajousenior/widgets/community_widget.dart';
import 'package:ajousenior/widgets/seniorai_widget.dart';
import 'package:ajousenior/widgets/seniorvolunteer_widget.dart';
import 'package:flutter/material.dart';

class SeniorHomeScreen extends StatelessWidget {
  const SeniorHomeScreen({super.key});

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
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Ai(),
                SizedBox(
                  height: 20,
                ),
                Community(),
                SizedBox(
                  height: 20,
                ),
                SeniorVolunteer(),
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
