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
        locations = list;
      });
    } catch (e) {
      // 예외 처리 코드를 추가합니다.
    }
  }

  void _showModalBottomSheet(
      BuildContext context, String name, String description) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Set<Marker> getMarkers() {
    return locations.map((location) {
      final LatLng position = LatLng(location['lat'], location['lng']);
      return Marker(
        markerId: MarkerId(location['id'].toString()),
        position: position,
        infoWindow: InfoWindow(
          title: location['name'],
          snippet: location['description'],
        ),
        onTap: () {
          _showModalBottomSheet(
              context, location['name'], location['description']);
        },
      );
    }).toSet();
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
          target: LatLng(37.546926, 126.911838),
          zoom: 14,
        ),
        markers: getMarkers(),
      ),
    );
  }
}
