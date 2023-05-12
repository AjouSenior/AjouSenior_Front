import 'package:ajousenior/models/senior_model.dart';
import 'package:ajousenior/screen/seniorhome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../services/login_service.dart';

class SignUpConfirm extends StatefulWidget {
  final Senior data;
  SignUpConfirm(this.data, {super.key});
  @override
  State<SignUpConfirm> createState() => _SignUpConfirmState();
}

class _SignUpConfirmState extends State<SignUpConfirm> {
  static const storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입 확인'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('이름 : ${widget.data.profile_nickname}'),
            Text('이메일 : ${widget.data.account_email}'),
            Text('나이 : ${widget.data.age_range}'),
            Text('시니어 센터 : ${widget.data.seniorcenter}'),
            ElevatedButton(
              onPressed: () async {
                final id = await LoginService.sendLogin(
                    widget.data.profile_nickname,
                    widget.data.account_email,
                    widget.data.gender,
                    widget.data.age_range,
                    widget.data.seniorcenter,
                    widget.data.birthday);
                widget.data.id = id;
                await storage.write(
                  key: 'login',
                  value: widget.data.toString(),
                );

                MaterialPageRoute(builder: (context) => SeniorHomeScreen());
              },
              child: Text('회원가입 완료'),
            ),
          ],
        ),
      ),
    );
  }
}
