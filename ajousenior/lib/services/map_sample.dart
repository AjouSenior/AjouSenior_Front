import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  List<Map<String, dynamic>> locations = [
    {
      'id': 1,
      'name': '세리경로당',
      'lat': 37.249561,
      'lng': 127.014319,
      'description': '공연요청',
    },
  ];

  void _showModalBottomSheet(
      BuildContext context, String name, String description) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 14),
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
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(37.546926, 126.911838),
          zoom: 14,
        ),
        markers: getMarkers(),
      ),
    );
  }
}
