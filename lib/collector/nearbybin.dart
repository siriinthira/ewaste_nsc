import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:app/collector/arrive_at_bin.dart';
// import 'package:user/collector/receive_task_from_user/main_location.dart';
import 'package:app/collector/view_user_selected_item.dart';

import 'package:location/location.dart';
import 'delivery_success.dart';

class NearByBin extends StatefulWidget {
  const NearByBin({super.key});

  @override
  State<NearByBin> createState() => _NearByBinState();
}

class _NearByBinState extends State<NearByBin> {
  //Google Map
  Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(14.071295662171114, 100.61685753122902),
    zoom: 14.4746,
  );

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(14.079229887949122, 100.6037063614499),
      infoWindow: InfoWindow(
        title: 'คุณอยู่ที่นี่ อุทยานวิทยาศาสตร์ประเทศไทย',
      ),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(14.073760003976798, 100.61528904039152),
      infoWindow: InfoWindow(
        title: 'โรงพยาบาลธรรมศาสตร์เฉลิมพระเกียรติ',
      ),
    ),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(14.071710129225782, 100.6167495927974),
      infoWindow: InfoWindow(
        title: 'มหาวิทยาลัยธรรมศาสตร์รังสิต',
      ),
    ),
  ];

  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    Future<Map<String, double>> _getCurrentLocation() async {
      Position currentPosition = await Geolocator.getCurrentPosition();
      double latitude = currentPosition.latitude;
      double longitude = currentPosition.longitude;
      return {'latitude': latitude, 'longitude': longitude};
    }

    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    var user_lat = 14.079379523123846;
    var user_lng = 100.60415036236294;

    return Scaffold(
      appBar: AppBar(
        title: Text('ค้นหาถังขยะในบริเวณใกล้เคียง'),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: SafeArea(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: GoogleMap(
                      // on below line setting camera position
                      initialCameraPosition: _kGoogle,
                      // on below line we are setting markers on the map
                      markers: Set<Marker>.of(_markers),
                      // on below line specifying map type.
                      mapType: MapType.normal,
                      // on below line setting user location enabled.
                      myLocationEnabled: true,
                      // on below line setting compass enabled.
                      compassEnabled: true,
                      // on below line specifying controller on map complete.
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      // ignore: prefer_collection_literals
                      circles: Set<Circle>.of([
                        Circle(
                          circleId: CircleId("1"),
                          center: LatLng(
                              (14.071295662171114), (100.61685753122902)),
                          radius: 1000,
                          strokeWidth: 2,
                          fillColor: Color(0xFF006491).withOpacity(0.2),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () async {
                        getUserCurrentLocation().then((value) async {
                          print(value.latitude.toString() +
                              " " +
                              value.longitude.toString());

                          // marker added for current users location
                          _markers.add(
                            Marker(
                              markerId: MarkerId("1"),
                              position: LatLng(value.latitude, value.longitude),
                              infoWindow: InfoWindow(
                                title:
                                    ' คุณอยู่ที่นี่ ${value.latitude} ${value.longitude} ',
                              ),
                            ),
                          );

                          // specified current users location
                          CameraPosition cameraPosition = new CameraPosition(
                            target: LatLng(value.latitude, value.longitude),
                            zoom: 14,
                          );

                          final GoogleMapController controller =
                              await _controller.future;
                          controller.animateCamera(
                              CameraUpdate.newCameraPosition(cameraPosition));
                          setState(() {});
                        });
                      },
                      child: Icon(Icons.my_location_rounded),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1,
              ),
              SizedBox(
                width: 360,
                height: 145,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(''),
                      const ListTile(
                        leading: Icon(Icons.share_location),
                        title: Text(
                            'คลิกปุ่มวงกลมสีเขียวด้านบนขวามือเพื่อค้นหาถังขยะใกล้คุณ  เมื่อถึงที่หมายแล้วกรุณาคลิกปุ่มด้านล่างเพื่อไปกรอกข้อมูลการนำส่ง'),
                        subtitle: Text(
                          '',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 240,
                child: ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ArriveAtBin()));
                  },
                  child: const Text('กรอกข้อมูลการนำส่ง'),
                ),
              ),
              const SizedBox(height: 35),
            ],
          ),
        ],
      ),
    );
  }
}
