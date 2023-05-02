import 'package:ajousenior/services/volunteerlist_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ajousenior/screen/map_sample.dart';
import '../models/senior_model.dart';
import '../services/junior_postvolunteer.dart';

class VolunteerListScreen extends StatefulWidget {
  const VolunteerListScreen({Key? key}) : super(key: key);

  @override
  State<VolunteerListScreen> createState() => _VolunteerListScreenState();
}

class _VolunteerListScreenState extends State<VolunteerListScreen> {
  static const storage = FlutterSecureStorage();
  dynamic userInfo = '';
  // storage에 있는 유저 정보를 저장

  _asyncMethod() async {
    // read 함수로 key값에 맞는 정보를 불러오고 데이터타입은 String 타입
    userInfo = await storage.read(key: 'login');
  }

  List<Map<String, dynamic>> locations = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
    _loadLocations();
  }

  void _loadLocations() async {
    try {
      final list = await GetVolListService().getVolList();
      setState(() {
        locations = list.cast<Map<String, dynamic>>();
        print("성공");
      });
    } catch (e) {}
  }

  Future<bool?> _showApplyDialog() async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("신청하시겠습니까?"),
          actions: <Widget>[
            TextButton(
              child: const Text("예"),
              onPressed: () => Navigator.of(context).pop(true),
            ),
            TextButton(
              child: const Text("아니오"),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('재능기부 선택'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.map_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MapScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.list_alt),
            onPressed: () {
              print('리스트 화면으로 전환');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final location = locations[index];
          return Card(
            child: Column(
              children: [
                Text(location['seniorcenter']),
                Text(location['content']),
                Text(location['date']),
                Text("최대 인원: ${location['maxpeople']}"),
                Text("현재 인원: ${location['currentpeople']}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (location['currentpeople'] <= location['maxpeople'])
                      ElevatedButton(
                        onPressed: () async {
                          Senior a = StringTo(userInfo);
                          final apply = await _showApplyDialog();
                          if (apply == true) {
                            JuniorPostVolunteer.sendVolunteer(location['_id'],
                                a.id, location['currentpeople'].toString());
                          }
                        },
                        child: const Text('신청'),
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
