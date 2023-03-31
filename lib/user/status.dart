import 'package:flutter/material.dart';
import 'package:app/model/data.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  final db = Mysql();
  List<Map<String, dynamic>> items = [];
  List<String> statusList = [];
  String? selectedStatus;

  @override
  void initState() {
    super.initState();
    _getItem();
  }

  void _getItem() {
    db.getConnection().then((conn) {
      String sql =
          'SELECT * FROM item JOIN status ON status.status_code = item.status_code;';
      conn.query(sql).then((results) {
        List<Map<String, dynamic>> items = [];
        for (var row in results) {
          items.add({
            'item_id': row['item_id'], // changed from 'id' to 'item_id'
            'item_name': row['item_name'], // changed from 'name' to 'item_name'
            'status_name': row['status_name'], // added 'status_name'
            'img_url': row['img_url'], // added 'img_url'
            'status_code': row['status_code'],
          });
          if (!statusList.contains(row['status_name'])) {
            statusList.add(row['status_name']);
          }
        }
        setState(() {
          this.items = items;
        });
      });
    });
  }

  List<Map<String, dynamic>> getFilteredItems() {
    if (selectedStatus != null && selectedStatus!.isNotEmpty) {
      return items
          .where((item) => item['status_name'] == selectedStatus)
          .toList();
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ติดตามสถานะ'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedStatus,
            hint: const Text('เลือกสถานะ'),
            items: statusList.map((String status) {
              return DropdownMenuItem<String>(
                value: status,
                child: Text(status),
              );
            }).toList(),
            onChanged: (String? newStatus) {
              setState(() {
                selectedStatus = newStatus;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: getFilteredItems().length,
              padding: const EdgeInsets.all(5),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(
                        'Item ID: ${getFilteredItems()[index]['item_id']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Item Name: ${getFilteredItems()[index]['item_name']}'),
                        Text(
                            'Status Name: ${getFilteredItems()[index]['status_name']}'),
                      ],
                    ),
                    leading: Image.network(
                      '${getFilteredItems()[index]['img_url']}',
                      width: 100,
                      height: 100,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
