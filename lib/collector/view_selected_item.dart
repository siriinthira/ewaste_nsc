import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class ViewSelectedItem extends StatefulWidget {
  const ViewSelectedItem({super.key});

  @override
  State<ViewSelectedItem> createState() => _ViewSelectedItemState();
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

class _ViewSelectedItemState extends State<ViewSelectedItem> {
  int _counter = 0;
  var db = new Mysql();
  var item = [];
  var ewaste_type = [];
  var request = [];
  Set<int> selectedItems = Set<int>();
  bool value = false;

  @override
  void initState() {
    super.initState();
    _getItem();
  }

  void _getItem() {
    db.getConnection().then((conn) {
      String sql =
          'SELECT * FROM item JOIN request ON item.req_id = request.req_id where item.item_id = 1359';
      conn.query(sql).then((results) {
        List<Map<String, dynamic>> items = [];
        for (var row in results) {
          items.add({
            'id': row['item_id'],
            'name': row['item_name'],
            'description': row['item_desc'],
            'image_url': row['img_url'],
            'amount': row['amount'],
            'lat': row['pick_lat'],
            'lng': row['pick_lng'],
            'detail': row['pick_detail'],
          });
        }
        setState(() {
          item = items;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('คำขอส่งขยะจากผู้ใช้'),
      ),
      body: ListView.builder(
        itemCount: item.length,
        padding: EdgeInsets.all(5),
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: ListTile(
            title: Column(
              children: [
                Text('รหัสสินค้า: ${item[index]['id']}'),
                Text('ชื่อสินค้า: ${item[index]['name']}'),
                Text('จำนวน: ${item[index]["amount"]}'),
                Text('ละติจูด: ${item[index]["lat"]} '),
                Text('ลองจิจูด: ${item[index]["lng"]} '),
                Text('เขต: ${item[index]["detail"]} '),
              ],
            ),
            // subtitle: Text('Item name: ${item[index][1]}'),
            leading: Image.network(
              '${item[index]["image_url"]}',
              width: 100,
              height: 100,
            ),
          ));
        },
      ),
    );
  }
}
