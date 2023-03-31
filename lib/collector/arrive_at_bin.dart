import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mysql1/mysql1.dart';

import 'package:app/collector/qr_code_scanner2.dart';

import 'delivery_success.dart';

//insert a textfield bin_id using mysql1 and the last elevated button called 'ส่งขยะเรียบร้อยแล้ว' with submit function

class ArriveAtBin extends StatefulWidget {
  const ArriveAtBin({super.key});

  @override
  State<ArriveAtBin> createState() => _ArriveAtBinState();
}

class _ArriveAtBinState extends State<ArriveAtBin> {
  //insert item into table
  var db = new Mysql();
  var bin_id = "";
  final binIdController = TextEditingController();

  void insertData() async {
    db.getConnection().then((conn) {
      String sqlQuery =
          'INSERT INTO `ewastedb`.`request` (`bin_id`) VALUES (?)';

      conn.query(sqlQuery, [
        binIdController.text,
      ]);
      setState(() {});
      print("Data Added");
      print(binIdController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    binIdController.dispose();
  }

  //Calculate Coin - ยังไม้ได้ใช้
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

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    var user_lat = 14.079379523123846;
    var user_lng = 100.60415036236294;
    return Scaffold(
      appBar: AppBar(
        title: Text('ผู้อาสาเดินทางมาถึงถังขยะ'),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: SafeArea(
                  child: AspectRatio(
                    aspectRatio: 3 / 3,
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
                            markerId: MarkerId("2"),
                            position: LatLng(value.latitude, value.longitude),
                            infoWindow: InfoWindow(
                              title: ' ${value.latitude} ${value.longitude} ',
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
              const SizedBox(height: 5),
              Text(
                'แสกนคิวอาร์โค้ดเพื่อตรวจสอบหมายเลขบนถังขยะ',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextFormField(
                  controller: binIdController,
                  decoration: const InputDecoration(
                      hintText: "กรุณาแสกนคิวอาร์เพื่อกรอกหมายเลขบนถังขยะ",
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                width: 240,
                child: ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QRCodeScanner()));
                  },
                  child: const Text('แสกนคิวอาร์โค้ด'),
                ),
              ),
              const SizedBox(height: 9),
              SizedBox(
                width: 240,
                child: ElevatedButton(
                  style: style,
                  onPressed: () {
                    insertData();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessDelivery()));
                  },
                  child: const Text('ส่งขยะเรียบร้อย'),
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
