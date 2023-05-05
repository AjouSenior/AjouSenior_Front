import 'package:ajousenior/screen/juniorvollist_screen.dart';
import 'package:ajousenior/services/volunteerlist_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/senior_model.dart';
import '../services/junior_postvolunteer.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const storage = FlutterSecureStorage();
  dynamic userInfo = '';
  // storage에 있는 유저 정보를 저장

  _asyncMethod() async {
    // read 함수로 key값에 맞는 정보를 불러오고 데이터타입은 String 타입
    userInfo = await storage.read(key: 'login');
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

  Set<Marker> getMarkers() {
    Set<Marker> markers = {};
    for (Map<String, dynamic> location in locations) {
      final LatLng position = LatLng(double.parse(location['latitude']),
          double.parse(location['longitude']));
      final Marker marker = Marker(
        markerId: MarkerId(location['seniorcenter']),
        position: position,
        infoWindow: InfoWindow(
          title: location['seniorcenter'],
          snippet: location['content'],
          onTap: () async {
            print("포스트실행");
            if (location['currentpeople'] <= location['maxpeople']) {
              Senior a = StringTo(userInfo);
              final apply = await _showApplyDialog();
              print("다이아로그실행완료");
              if (apply == true) {
                JuniorPostVolunteer.sendVolunteer(location['_id'], a.id,
                    location['currentpeople'].toString());
              }
            }
          },
        ),
      );
      markers.add(marker);
    }
    return markers;
  }

  late GoogleMapController mapController;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('재능기부 선택'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.map_outlined),
          onPressed: () {
            // 아이콘 버튼 실행
          },
        ),
        IconButton(
          icon: const Icon(Icons.list_alt), // 검색 아이콘 생성
          onPressed: () {
            // 아이콘 버튼 실행
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const VolunteerListScreen(),
              ),
            );
          },
        ),
      ]),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.283653, 127.045009),
          zoom: 14,
        ),
        markers: getMarkers(),
      ),
    );
  }
}