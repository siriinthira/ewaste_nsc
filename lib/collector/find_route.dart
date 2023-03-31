import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:app/collector/main_location.dart';
import 'package:app/collector/view_user_selected_item.dart';

import 'delivery_success.dart';
import 'nearbybin.dart';

class sendItemNearbyBin extends StatefulWidget {
  const sendItemNearbyBin({super.key});

  @override
  State<sendItemNearbyBin> createState() => _sendItemNearbyBinState();
}

class _sendItemNearbyBinState extends State<sendItemNearbyBin> {
  void calculateCoin(int weight) {
    if (weight >= 1 && weight < 5) {
      var coin = 0.25;
    } else if (weight > 5) {
      var coin = 0.5;
    }
  }

  Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(20.42796133580664, 75.885749655962),
      infoWindow: InfoWindow(
        title: 'My Position',
      ),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(14.07892748920073, 100.60297357512478),
      infoWindow: InfoWindow(
        title: 'อุทยานวิทยาศาสตร์ประเทศไทย',
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
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    var user_lat = 14.079379523123846;
    var user_lng = 100.60415036236294;
    return Scaffold(
      appBar: AppBar(
        title: Text('รับงานจากผู้ใช้'),
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
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
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
                          _markers.add(Marker(
                            markerId: MarkerId("2"),
                            position: LatLng(value.latitude, value.longitude),
                            infoWindow: InfoWindow(
                              title:
                                  // 'พิกัดของผู้ใช้ : 14.07866732509696, 100.60400354337204'
                                  ' คุณอยู่ที่นี่: ${value.latitude} ${value.longitude} ',
                            ),
                          ));

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
                height: 10,
              ),
              SizedBox(
                width: 360,
                height: 100,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text('พิกัดของผู้ใช้'),
                      const ListTile(
                        leading: Icon(Icons.share_location),
                        title: Text('อุทยานวิทยาศาสตร์ประเทศไทย'),
                        subtitle: Text(
                          '14.079379523123846, 100.60396022687425',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 360,
                height: 65,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.generating_tokens),
                        title: Text('จำนวนเหรียญที่ได้รับ : 0.25 เหรียญ'),
                        // subtitle:
                        //     Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
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
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ViewSelectedItem()));
                  },
                  child: const Text('คลิกดูรายการขยะ'),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 240,
                child: ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NearByBin()));
                  },
                  child: const Text('ค้นหาถังขยะในพื้นที่'),
                ),
              ),
              const SizedBox(height: 5),
              const SizedBox(height: 35),
            ],
          ),
        ],
      ),
    );
  }
}
