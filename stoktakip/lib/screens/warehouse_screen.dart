import 'package:flutter/material.dart';

class WarehouseScreen extends StatefulWidget {
  const WarehouseScreen({Key? key}) : super(key: key);

  @override
  State<WarehouseScreen> createState() => _WarehouseScreenState();
}

class _WarehouseScreenState extends State<WarehouseScreen> {

  TextEditingController _controller = TextEditingController();

  List<Warehouse> items = [
    Warehouse(
      id: 1,
      name: 'İçmesuyu Dairesi',
    ),
    Warehouse(
      id: 2,
      name: 'Kanalizasyon Dairesi',
    ),
    Warehouse(
      id: 3,
      name: 'Abone Hizmetleri Dairesi',
    ),
    Warehouse(
      id: 4,
      name: 'Bilgi İşlem Dairesi',
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(15, 101, 135, 1),
        title: Text('Depolar'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            labelText: 'Depo Adı',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          child: Text('Ekle'),
                          onPressed: () {
                            setState(() {
                              items.add(
                                Warehouse(
                                  id: items.length + 1,
                                  name: _controller.text,
                                ),
                              );
                              _controller.text ="";
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Text(items[index].id.toString(), style: TextStyle(color: Colors.white)),
            ),
            title: Text(items[index].name),
          );
        },
      ),
    );
  }
}

class Warehouse {
  final int id;
  final String name;

  Warehouse({required this.id, required this.name});
}