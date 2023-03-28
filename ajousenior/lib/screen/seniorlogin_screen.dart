import 'package:ajousenior/widgets/seniorkakao_widget.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class SeniorLoginScreen extends StatelessWidget {
  const SeniorLoginScreen({super.key});
  void _get_user_info() async {
    try {
      User user = await UserApi.instance.me();
      print('사용자 정보 요청 성공'
          '\n회원번호: ${user.id}'
          '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
          '\n닉네임: ${user.kakaoAccount?.ageRange}');
    } catch (error) {
      print('사용자 정보 요청 실패 $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SeniorKakao(),
          ElevatedButton(
              child: const Text('카카오로그인'),
              onPressed: () async {
                if (await isKakaoTalkInstalled()) {
                  try {
                    await UserApi.instance.loginWithKakaoTalk();
                    print('카카오톡으로 로그인 성공');
                    _get_user_info();
                  } catch (error) {
                    print('카카오톡으로 로그인 실패 $error');
                    // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
                    try {
                      await UserApi.instance.loginWithKakaoAccount();
                      print('카카오계정으로 로그인 성공');
                      _get_user_info();
                    } catch (error) {
                      print('카카오계정으로 로그인 실패 $error');
                    }
                  }
                } else {
                  try {
                    await UserApi.instance.loginWithKakaoAccount();
                    print('카카오계정으로 로그인 성공');
                    _get_user_info();
                  } catch (error) {
                    print('카카오계정으로 로그인 실패 $error');
                  }
                }
              })
        ],
      ),
    );
  }
}
