import 'package:app/collector/view_selected_item.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_routes/google_maps_routes.dart';
import 'package:mysql1/mysql1.dart';
import 'package:app/collector/view_selected_item.dart';
import 'find_route.dart';

import 'package:permission_handler/permission_handler.dart';

class receiveTask extends StatefulWidget {
  final List<Map<String, dynamic>> selectedList;
  const receiveTask({Key? key, required this.selectedList}) : super(key: key);

  @override
  State<receiveTask> createState() => _receiveTaskState();
}

class _receiveTaskState extends State<receiveTask> {
//Get Current Position
  Position? currentPosition;
  GoogleMapController? mapController;
  final Map<String, Marker> _markers2 = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _updateCurrentPosition() async {
    currentPosition = await Geolocator.getCurrentPosition();
    if (currentPosition != null) {
      final marker = Marker(
        markerId: MarkerId('current_location'),
        position: LatLng(currentPosition!.latitude, currentPosition!.longitude),
        infoWindow: const InfoWindow(
          title: 'You are here',
        ),
      );
      setState(() {
        _markers2['Current Location'] = marker;
      });
      mapController!
          .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(currentPosition!.latitude, currentPosition!.longitude),
        zoom: 15.0,
      )));
    }
  }

//calculate coin
  void calculateCoin(int weight) {
    if (weight >= 1 && weight < 5) {
      var coin = 0.25;
    } else if (weight > 5) {
      var coin = 0.5;
    }
  }

// ShowMap
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
      position: LatLng(14.071430942047572, 100.61692458471443),
      infoWindow: InfoWindow(
        title: 'My Position: Thammasat University Rangsit Campus',
      ),
    ),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(14.078688138236172, 100.60404109429771),
        infoWindow: InfoWindow(
          title: 'อุทยานวิทยาศาสตร์ประเทศไทย',
        )),
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

//insert item into the table
  var db = new Mysql();
  double? rp_lat;
  double? rp_lng;
  var status_code = 2;
  DateTime? rp_timestamp;
  int agent_id = 1;

  void insertData() async {
    // Check if the user has granted permission to access the device's location
    var locationPermissionStatus = await Permission.location.request();

    if (locationPermissionStatus.isDenied) {
      // Permission was denied by the user, handle the error
      print('Location permission was denied by the user.');
      return;
    }

    final now = DateTime.now();
    Position currentPosition = await Geolocator.getCurrentPosition();
    double latitude = currentPosition.latitude;
    double longitude = currentPosition.longitude;

    db.getConnection().then((conn) {
      String sqlQuery =
          'INSERT INTO `ewastedb`.`request_process` (`rp_lat`, `rp_lng`, `status_code`, `rp_timestamp`, `agent_id` ) VALUES (?, ?, ?, ?, ?)';
      conn.query(sqlQuery, [
        latitude.toString(),
        longitude.toString(),
        status_code,
        now.toString(),
        agent_id
      ]);
      setState(() {});
      print("Data Added");
      // print(itemIdController.text);
      // print(BinIdController.text);
      // print(pickUpLatController.text);
      // print(pickUpLngController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    var user_lat = 14.079379523123846;
    var user_lng = 100.60415036236294;
    return Scaffold(
      appBar: AppBar(
        title: Text('ค้นหาเส้นทางบนแผนที่ '),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: SafeArea(
                  child: AspectRatio(
                    aspectRatio: 3 / 2.5,
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
                height: 5,
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
                            markerId: MarkerId("1"),
                            position: LatLng(value.latitude, value.longitude),
                            infoWindow: InfoWindow(
                              title:
                                  ' คุณอยู่ที่นี่ ${value.latitude} ${value.longitude} ',
                            ),
                          ));

                          _markers.add(Marker(
                            markerId: MarkerId("2"),
                            position: LatLng(value.latitude, value.longitude),
                            infoWindow: InfoWindow(
                              title:
                                  ' พิกัดของผู้ใช้ ${value.latitude} ${value.longitude} ',
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
                height: 5,
              ),
              // //
              // SizedBox(
              //   width: 360,
              //   height: 500,
              //   child: Card(
              //     child: Column(
              //       mainAxisSize: MainAxisSize.max,
              //       children: <Widget>[
              //         Text('พิกัดที่คุณอยู่'),
              //         Expanded(
              //           child: GoogleMap(
              //             onMapCreated: _onMapCreated,
              //             markers: _markers.toSet(),
              //             initialCameraPosition: CameraPosition(
              //               target:
              //                   LatLng(13.778597300117617, 100.56008663339044),
              //               zoom: 15.0,
              //             ),
              //           ),
              //         ),
              //         const SizedBox(height: 8),
              //         const Divider(height: 0),
              //         TextButton.icon(
              //           onPressed: _updateCurrentPosition,
              //           icon: const Icon(Icons.my_location),
              //           label: const Text('Get Current Position'),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 360,
                height: 110,
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text('พิกัดที่ผู้ใช้งานเรียก'),
                      const ListTile(
                        leading: Icon(Icons.share_location),
                        title: Text('อุทยานวิทยาศาสตร์ประเทศไทย'),
                        subtitle: Text(
                          '14.079262043026732, 100.60421575023001',
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
              const SizedBox(height: 5),
              SizedBox(
                width: 210,
                child: ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewSelectedItem()));
                  },
                  child: const Text('คลิกดูรายการขยะ'),
                ),
              ),
              const SizedBox(height: 5),
              // SizedBox(
              //   width: 210,
              //   child: ElevatedButton(
              //     style: style,
              //     onPressed: () {
              //       insertData();
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => sendItemNearbyBin()));
              //     },
              //     child: const Text('กดเพื่อรับงาน'),
              //   ),
              // ),
              SizedBox(
                width: 210,
                child: ElevatedButton(
                  style: style,
                  onPressed: () {
                    try {
                      insertData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => sendItemNearbyBin()),
                      );
                    } catch (e) {
                      // print the error message to the console
                      print('Error occurred: $e\n');
                    }
                  },
                  child: const Text('กดเพื่อรับงาน'),
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

class Mysql {
  static String host = 'utcccs.cj5octuotk3f.ap-northeast-1.rds.amazonaws.com',
      user = 'ewuser',
      password = 'ewuser123',
      db = 'ewastedb';

  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }
}
