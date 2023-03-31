import 'package:app/user/user_home.dart';
import 'package:flutter/material.dart';
import 'package:app/style/constants.dart';
import '../Model/data.dart';
import 'package:mysql1/mysql1.dart';

import '../main.dart';

class RequestCollector extends StatefulWidget {
  @override
  _RequestCollectorState createState() => _RequestCollectorState();
}

class _RequestCollectorState extends State<RequestCollector> {
  bool value = false;
  int _counter = 0;
  var db = new Mysql();
  var item = [];
  Set<int> selectedItems = Set<int>();

  @override
  void initState() {
    super.initState();
    _getItem();
  }

  void _getItem() {
    db.getConnection().then((conn) {
      String sql = 'select * from item';
      conn.query(sql).then((results) {
        List<Map<String, dynamic>> items = [];
        for (var row in results) {
          items.add({
            'id': row['item_id'],
            'name': row['item_name'],
            'description': row['item_desc'],
            'image_url': row['img_url'],
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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('รายการขยะ'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: item.length,
        padding: EdgeInsets.all(5),
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: ListTile(
                  title: Text('Item Name: ${item[index]['name']}'),
                  subtitle: Text('description: ${item[index]['description']}'),
                  leading: Image.network(
                    '${item[index]['image_url']}',
                    width: 100,
                    height: 100,
                  ),
                  trailing: Checkbox(
                    value: selectedItems.contains(index),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          selectedItems.add(index);
                        } else {
                          selectedItems.remove(index);
                        }
                      });
                    },
                  )));
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          List<Map<String, dynamic>> selectedList = [];
          for (int i = 0; i < item.length; i++) {
            if (selectedItems.contains(i)) {
              selectedList.add(item[i]);
            }
          }
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SelectedItemsPage(selectedList: selectedList)),
          );
        },
        label: Text(
          'เพิ่มลงรายการ(${selectedItems.length})',
        ),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class SelectedItemsPage extends StatelessWidget {
  final List<Map<String, dynamic>> selectedList;
  const SelectedItemsPage({Key? key, required this.selectedList})
      : super(key: key);

  Future<void> insertSelectedItems(
      List<Map<String, dynamic>> selectedList, int itemListId) async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'utcccs.cj5octuotk3f.ap-northeast-1.rds.amazonaws.com',
      port: 3306,
      user: 'ewuser',
      password: 'ewuser123',
      db: 'ewastedb',
    ));

    for (var item in selectedList) {
      await conn
          .query('INSERT INTO item_list (list_id, item_id) VALUES (?, ?)', [
        itemListId,
        item['id'],
      ]);
    }
    await conn.close();
    itemListId++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('ยืนยันรายการขยะ'), backgroundColor: Colors.green),
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF5F4EF),
              image: DecorationImage(
                image: AssetImage("images/Message_senl.png"),
                alignment: Alignment.topRight,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 50, right: 20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "รายการขยะ",
                            style: kHeading,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: selectedList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: <Widget>[
                                  Text(
                                    "${selectedList[index]['id']}",
                                    style: ktitle.copyWith(
                                      color: kTextColor.withOpacity(.15),
                                      fontSize: 32,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              "Name: ${selectedList[index]['name']}\n",
                                          style: TextStyle(
                                            color: kTextColor.withOpacity(.5),
                                            fontSize: 18,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "${selectedList[index]['description']}",
                                          style: ksubtitle.copyWith(
                                            fontWeight: FontWeight.w600,
                                            height: 1.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 50,
                            color: kTextColor.withOpacity(.1))
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RequestCollector(),
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => RequestCollector(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(14),
                              height: 56,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFCDD2),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Icon(
                                Icons.arrow_back_ios,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                int itemListId = 9;
                                insertSelectedItems(selectedList, itemListId)
                                    .then((value) {
                                  print('Selected items inserted successfully');
                                  itemListId++;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Selected items inserted successfully!'),
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UserHome(
                                        title: '',
                                      ),
                                    ),
                                  );
                                }).catchError((error) {
                                  print(
                                      'Error inserting selected items: $error');
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.green,
                                ),
                                child: Text(
                                  "ยืนยันรายการขยะ",
                                  style: ksubtitle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
