import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class ViewItem extends StatefulWidget {
  @override
  _ViewItemState createState() => _ViewItemState();
}

class _ViewItemState extends State<ViewItem> {
  bool value = false;
  int _counter = 0;
  var db = new Mysql();
  var item = [];

  @override
  void initState() {
    super.initState();
    _getItem();
  }

  void _getItem() {
    db.getConnection().then((conn) {
      String sql = 'select * from item';
      conn.query(sql).then((results) {
        setState(() {
          item = results.toList();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ดูรายการขยะ'),
      ),
      body: ListView.builder(
        itemCount: item.length,
        padding: EdgeInsets.all(5),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text('Serial No.: ${item[index][7]}'),
              subtitle: Text('Item Name: ${item[index][1]}'),
              leading: Image.network(
                '${item[index][8]}',
                width: 100,
                height: 100,
              ),
            ),
          );
        },
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
