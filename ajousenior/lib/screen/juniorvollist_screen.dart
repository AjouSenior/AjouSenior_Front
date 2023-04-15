import 'package:ajousenior/services/map_sample.dart';
import 'package:ajousenior/services/volunteerlist_service.dart';
import 'package:flutter/material.dart';

class VolunteerListScreen extends StatefulWidget {
  const VolunteerListScreen({super.key});

  @override
  State<VolunteerListScreen> createState() => _VolunteerListScreenState();
}

class _VolunteerListScreenState extends State<VolunteerListScreen> {
  List<Map<String, dynamic>> locations = [];
  @override
  void initState() {
    super.initState();
    _loadLocations(); // initState() 메서드에서 _loadLocations() 메서드를 호출합니다.
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('재능기부 선택'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.map_outlined),
          onPressed: () {
            // 아이콘 버튼 실행
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MapScreen(),
              ),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.list_alt), // 검색 아이콘 생성
          onPressed: () {
            // 아이콘 버튼 실행
            print('리스트 화면으로 전환');
          },
        ),
      ]),
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
              ],
            ),
          );
        },
      ),
    );
  }
}
