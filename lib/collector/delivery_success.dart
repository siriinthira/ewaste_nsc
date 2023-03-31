import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:app/collector/nearbybin.dart';

import 'nearbybin.dart';
import 'find_route.dart';

class SuccessDelivery extends StatefulWidget {
  const SuccessDelivery({super.key});

  @override
  State<SuccessDelivery> createState() => _SuccessDeliveryState();
}

class _SuccessDeliveryState extends State<SuccessDelivery> {
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), primary: Colors.green);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        title: 'ส่งขยะเรียบร้อยแล้ว',
        home: Scaffold(
          appBar: AppBar(
            title: Text('ส่งขยะเรียบร้อยแล้ว'),
            backgroundColor: Colors.green,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // Using Image.asset widget to display a GIF from assets
                  Image.asset(
                    'images/delivery.gif',
                    width: 250,
                    height: 250,
                  ),
                  SizedBox(height: 20),
                  // Using Image.network widget to display a GIF from URL
                  // Image.network(
                  //   'https://media.tenor.com/zcIGS7EY6XYAAAAC/circle-green.gif',
                  //   width: 250,
                  //   height: 250,
                  // ),
                  Text(
                    'จัดส่งสำเร็จ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'ได้รับ 0.25 เหรียญ',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'ขยะอิเล็กทรอนิกส์ของคุณได้ถูกนำไปส่ง                          ที่ถังขยะเรียบร้อยแล้ว',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                  ),
                  SizedBox(
                    height: 65,
                  ),
                  SizedBox(
                    width: 240,
                    child: ElevatedButton(
                      style: style,
                      onPressed: () {},
                      child: const Text('ติดต่อขอความช่วยเหลือ'),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 240,
                    child: ElevatedButton(
                      style: style,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NearByBin()));
                      },
                      child: const Text('ย้อนกลับ'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
