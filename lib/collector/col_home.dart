import 'package:app/collector/view_all_items.dart';
import 'package:flutter/material.dart';
import 'package:app/collector//view_request.dart';
import 'package:app/collector/view_collector_items.dart';
import 'package:app/collector/check_status.dart';
import 'package:app/collector/search_bin2.dart';

class CollectorHome extends StatefulWidget {
  const CollectorHome({super.key, required this.title});

  final String title;

  @override
  State<CollectorHome> createState() => _CollectorHomeState();
}

class _CollectorHomeState extends State<CollectorHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        //we will devide the screen into two parts
        //fixed height for first half
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3.2,
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'ยินดีต้อบรับ!,   ',
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'มิสเตอร์ เควิน',
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'รหัส 123456 | เข้าร่วมในปี 2023',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 14.0,
                            ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: 160,
                        height: 23,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 185, 173, 77),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            'สมาชิกระดับยศทอง',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      //go to profile edit screen here
                    },
                    child: CircleAvatar(
                      minRadius: 50.0,
                      maxRadius: 50.0,
                      backgroundColor: Color.fromARGB(255, 117, 129, 135),
                      backgroundImage: AssetImage("images/recycleman.jpg"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      //go to attendance screen here
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                        color: Colors.green.shade500,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'คะแนนคาร์บอน',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1.0,
                                    wordSpacing: 3.0),
                          ),
                          Text(
                            '0.5 kg',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 3.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //go to attendance screen here
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                        color: Colors.green.shade500,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'เหรียญ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1.0),
                          ),
                          Text(
                            '59',
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      fontSize: 25.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        //other will use all the remaining height of screen
        Expanded(
          child: Container(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 212, 245, 234),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              //
              child: Padding(
                padding: const EdgeInsets.all(50.0), //adjust size of card
                child: GridView(
                  children: [
                    //
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewAllItems()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.list_alt_outlined,
                              size: 50,
                              color: Colors.green,
                            ),
                            Text(
                              "ดูรายการขยะ",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckStatus()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.track_changes,
                              size: 50,
                              color: Colors.green,
                            ),
                            Text(
                              "ติดตามสถานะ",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewRequest()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_task_rounded,
                              size: 50,
                              color: Colors.green,
                            ),
                            Text(
                              "รับงานนำส่งขยะ",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => searchBin()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              size: 50,
                              color: Colors.green,
                            ),
                            Text(
                              "ค้นหาถังขยะ",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),

                    //
                  ],
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
