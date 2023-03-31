import 'package:app/user/qrcode.dart';
import 'package:app/user/request.dart';
import 'package:app/user/view_item.dart';
import 'package:flutter/material.dart';

import 'package:mysql1/mysql1.dart';

import 'dart:async';

// import 'package:app/user/qrcode.dart';

import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:app/user/view_item.dart';

class sendItem extends StatefulWidget {
  const sendItem({super.key});

  @override
  State<sendItem> createState() => _sendItemState();
}

class _sendItemState extends State<sendItem> {
  //Map Controller starts here

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

  //Map ends here

  //insert item into the table
  var db = new Mysql();
  double? pick_lat;
  double? pick_lng;
  int pickup_type_id = 2; //drop down
  var bin_id = "";
  var item_id = ""; //ดูหน้ารายการขยะ

  final itemIdController = TextEditingController();
  final BinIdController = TextEditingController();
  final pickUpLatController = TextEditingController();
  final pickUpLngController = TextEditingController();

  void insertData() async {
    final now = DateTime.now();
    Position currentPosition = await Geolocator.getCurrentPosition();
    double latitude = currentPosition.latitude;
    double longitude = currentPosition.longitude;

    db.getConnection().then((conn) {
      String sqlQuery =
          'INSERT INTO `ewastedb`.`request` (`item_id`, `pick_lat`, `pick_lng`, `bin_id`, `pickup_type_id`, `req_date` ) VALUES (?, ?, ?, ?, ?, ?)';
      conn.query(sqlQuery, [
        itemIdController.text,
        // pickUpLatController.text,
        // pickUpLngController.text,
        latitude.toString(),
        longitude.toString(),
        BinIdController.text,
        pickup_type_id,
        now.toString(),
      ]);
      setState(() {});
      print("Data Added");
      print(itemIdController.text);
      print(BinIdController.text);
      print(pickUpLatController.text);
      print(pickUpLngController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    itemIdController.dispose();
    BinIdController.dispose();
    pickUpLatController.dispose();
    pickUpLngController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var key;
    return Scaffold(
      appBar: AppBar(
        title: Text("นำส่งขยะด้วยตนเอง"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          Column(
            children: [
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
            ],
          ),
          SizedBox(
            height: 15,
          ),
          FloatingActionButton(
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

                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(cameraPosition));
                setState(() {});
              });
            },
            child: Icon(Icons.my_location_rounded),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'คลิกเพื่อค้นหาพิกัดของถังขยะที่ต้องการนำส่ง',
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 24,
          ),
          ElevatedButton(
            child: const Text(
              'คลิกเพื่อดูรายการขยะ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RequestCollector()), //change Request Collector to RequestProcess
              );
            },
          ),
          SizedBox(height: 24),
          Text(
            'คลิกที่ปุ่ม ด้านบน เพื่อตรวจสอบหมายเลขขยะ',
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.center,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: itemIdController,
            decoration: InputDecoration(
                hintText: "โปรดหมายเลขขยะอิเล็กทรอนิกส์",
                border: OutlineInputBorder()),
          ),
          SizedBox(height: 15),
          // Text(
          //   'กรุณา คัดลอก ละติจูด ใต้แผนที่',
          //   style: TextStyle(fontSize: 17),
          //   textAlign: TextAlign.center,
          // ),
          // TextFormField(
          //   keyboardType: TextInputType.number,
          //   controller: pickUpLatController,
          //   decoration: const InputDecoration(
          //       hintText: "กรุณากรอก ละติจูด ", border: OutlineInputBorder()),
          // ),
          // SizedBox(height: 15),
          // Text(
          //   'กรุณา คัดลอก ลองจิจูด ใต้แผนที่',
          //   style: TextStyle(fontSize: 17),
          //   textAlign: TextAlign.center,
          // ),
          // TextFormField(
          //   keyboardType: TextInputType.number,
          //   controller: pickUpLngController,
          //   decoration: const InputDecoration(
          //       hintText: "กรุณากรอก ลองจิจูด ", border: OutlineInputBorder()),
          // ),
          const SizedBox(height: 15),

          Text(
            'แสกนคิวอาร์โค้ดเพื่อรับหมายเลขขยะ',
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.center,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: BinIdController,
            decoration: const InputDecoration(
                hintText: "คัดลอกหมายเลขถังขยะและกดวางในช่องนี้",
                border: OutlineInputBorder()),
            validator: (value) {
              if (value!.isEmpty) {
                return 'โปรดระบุจำนวนสินค้า = 1';
              } else if (int.parse(value) != 1) {
                return "สามารถเพิ่มสินค้าได้ครั้งละหนึ่งรายการ";
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QRCodeScanner()),
              );
            },
            child: Text('แสกน QR Code'),
            // child: Icon(Icons.qr_code_scanner_outlined),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              insertData();
              print('Data inserted successfully!');
            },
            child: const Text('ส่งขยะเรียบร้อย'),
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

/*
Pick or capture image using image_picker
Upload the image to Firebase storage
Get the URL of the uploaded image
Store the image URL inside the corresponding document in database

 */


//https://www.youtube.com/watch?v=nEcb3ieAICs
//https://www.youtube.com/watch?v=c2tGUt7FLqY
//https://www.youtube.com/watch?v=7XOQAtSTw4s
// https://www.youtube.com/watch?v=g8WEXj6xvsY
/*

http method = post
enctype = multiport / form data
 */
