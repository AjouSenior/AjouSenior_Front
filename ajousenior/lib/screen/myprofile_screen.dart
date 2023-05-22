import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ajousenior/models/senior_model.dart';
import '../widgets/logout_widget.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  static var storage = const FlutterSecureStorage();
  dynamic userInfo = '';
  late Senior user;

  @override
  void initState() {
    super.initState();
    // 비동기로 flutter secure storage 정보를 불러오는 작업
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //_asyncMethod();
      /*if (userInfo != '') {
        user = StringTo(userInfo);
      }*/
    });
  }

  Future<Senior> _asyncMethod() async {
    // read 함수로 key값에 맞는 정보를 불러오고 데이터타입은 String 타입
    userInfo = await storage.read(key: 'login');
    user = StringTo(userInfo);
    return user;
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
        body: Padding(
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
<<<<<<< HEAD
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'test',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
=======
                              FutureBuilder<Senior>(
                                future: _asyncMethod(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('${snapshot.error}');
                                  } else if (!snapshot.hasData) {
                                    return const Text('No data');
                                  } else {
                                    //final user = snapshot.data!;
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          user.profile_nickname!,
                                          style: const TextStyle(
                                            fontSize: 30,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          user.account_email!,
                                          style: const TextStyle(
                                            fontSize: 25,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    );
                                  }
                                },
>>>>>>> 28ea7766ae225b5f4102d3986e881ade3bb0a47d
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
              Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  itemBuilder: (context, index) => ListTile(
                    title: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'text',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'text',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                ),
              ),
              const LogOut(),
            ],
          ),
        ),
      ),
    );
  }
}
