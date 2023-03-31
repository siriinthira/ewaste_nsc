import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app/model/bin_model.dart';

class searchBin extends StatefulWidget {
  const searchBin({super.key});

  @override
  State<searchBin> createState() => _searchBinState();
}

class _searchBinState extends State<searchBin> {
  static List<BinModel> main_bin_list = [
    BinModel(
        "โรงอาหาร",
        "มหาวิทยาลัยหอการค้าไทย",
        25.0,
        "https://www.tcijthai.com/ckfinder/userfiles/images/11(201).jpg",
        13.778856883008975,
        100.56007916857388),
    BinModel(
        "ตึก 1 IDE Learning Space",
        "มหาวิทยาลัยหอการค้าไทย",
        9.3,
        "https://cdn.marketingoops.com/wp-content/uploads/2016/08/UTCC4.jpg",
        13.778856883008975,
        100.56007916857388),
    BinModel(
        "ตึก 24 ชั้น 5",
        "มหาวิทยาลัยหอการค้าไทย",
        68.0,
        "https://www.vaninter.com/wp-content/uploads/2021/10/8UWnc2TI.jpeg",
        13.778856883008975,
        100.56007916857388),
    BinModel(
        "Co-Working Space",
        "มหาวิทยาลัยหอการค้าไทย",
        0.0,
        "https://baanlaesuan.com/app/uploads/2022/05/UTCC-6.jpg",
        13.778856883008975,
        100.56007916857388)
  ];

  //creating the list that we're going to display and filter
  List<BinModel> display_list = List.from(main_bin_list);

  void updateList(String value) {
    //this is the function that will filter our list
    setState(() {
      display_list = main_bin_list
          .where((element) =>
              element.bin_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1f1545),
      appBar: AppBar(
        title: Text("ค้นหาถังขยะในมหาวิทยาลัยหอการค้า"),
        backgroundColor: Color(0xFF1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a Bin",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: มหาวิทยาลัยหอการค้าไทย",
                suffixIcon: Icon(Icons.search),
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.purple.shade900,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: display_list.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text(
                    display_list[index].bin_title!,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${display_list[index].bin_address!}',
                    style: TextStyle(color: Colors.white60),
                  ),
                  trailing: Text(
                    "${display_list[index].bin_capicity}" + " %", // !  ??
                    style: TextStyle(color: Colors.amber),
                  ),
                  leading: Image.network(
                    display_list[index].bin_poster_url!,
                    height: 100,
                    width: 80,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("search Bin"),
    //   ),
    // );
  }
}
