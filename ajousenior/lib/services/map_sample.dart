import 'package:ajousenior/screen/juniorvollist_screen.dart';
import 'package:ajousenior/services/volunteerlist_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

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

  Set<Marker> getMarkers() {
    Set<Marker> markers = {};

    for (Map<String, dynamic> location in locations) {
      final LatLng position = LatLng(double.parse(location['latitude']),
          double.parse(location['longitude']));
      print("마커 생성");
      markers.add(
        Marker(
          markerId: MarkerId(location['seniorcenter']),
          position: position,
          infoWindow: InfoWindow(
            title: location['seniorcenter'],
            snippet: location['content'],
          ),
        ),
      );
    }
    return markers;
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
