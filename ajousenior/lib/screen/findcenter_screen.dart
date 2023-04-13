import 'package:ajousenior/screen/senior_screen.dart';
import 'package:flutter/material.dart';
import 'package:ajousenior/services/findcenter_service.dart';
import 'package:ajousenior/services/login_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/senior_model.dart';

class FindCenterWidget extends StatefulWidget {
  final Senior data;
  const FindCenterWidget(this.data, {super.key});

  @override
  State<FindCenterWidget> createState() => _FindCenterWidgetState();
}

class _FindCenterWidgetState extends State<FindCenterWidget> {
  static const storage = FlutterSecureStorage();
  final TextEditingController _controller = TextEditingController();
  Map<String, dynamic> _dataList = {};

  Future<void> _search() async {
    final result = await FindCenterService.findCenter(_controller.text);
    if (result != null) {
      setState(() {
        _dataList = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Listview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: InkWell(
                  onTap: _search,
                  child: const Icon(Icons.search),
                ),
              ),
              controller: _controller,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _dataList['data']?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  final specificValue = _dataList['data'][index]['BIZPLC_NM'];
                  final lat = _dataList['data'][index]['REFINE_WGS84_LAT'];
                  final LOGT = _dataList['data'][index]['REFINE_WGS84_LOGT'];
                  return GestureDetector(
                    onTap: () async {
                      final id = await LoginService.sendLogin(
                          widget.data.profile_nickname,
                          widget.data.account_email,
                          widget.data.gender,
                          widget.data.age_range,
                          specificValue,
                          widget.data.birthday);
                      widget.data.seniorcenter = specificValue;
                      widget.data.id = id;
                      await storage.write(
                        key: 'login',
                        value: widget.data.toString(),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SeniorScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(specificValue),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
