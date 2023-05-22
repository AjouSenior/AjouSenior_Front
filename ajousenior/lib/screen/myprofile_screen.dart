import 'package:ajousenior/models/senior_model.dart';
import 'package:ajousenior/widgets/logout_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({data, super.key});
  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  static var storage = const FlutterSecureStorage();
  dynamic userInfo = '';
  print(userInfo) async => throw UnimplementedError();
  Widget body = const Center(
    child: CircularProgressIndicator(),
  );

  Future<void> _asyncMethod() async {
    // read 함수로 key값에 맞는 정보를 불러오고 데이터타입은 String 타입
    userInfo = await storage.read(key: 'login');
    setState(() {
      if (userInfo == null || userInfo.isEmpty) {
        body = const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        Senior a = StringTo(userInfo);
        // userInfo가 값이 있는 경우 body를 구성하는 코드
        body = Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                height: 130,
                width: double.maxFinite,
                child: Card(
                  elevation: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          width: 9.0,
                          color: Colors.black,
                        ),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 95,
                                height: 95,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 80,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    a.profile_nickname!,
                                    style: const TextStyle(
                                      fontSize: 30,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    a.account_email!,
                                    style: const TextStyle(
                                      fontSize: 25,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const LogOut()
            ],
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false; // 뒤로가기 버튼을 무시하고 아무 동작도 하지 않음
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
        body: body,
      ),
    );
  }
}
