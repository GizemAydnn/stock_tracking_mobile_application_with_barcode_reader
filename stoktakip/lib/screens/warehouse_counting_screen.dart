import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:stoktakip/contstants/data.dart';

class WarehouseCountingScreen extends StatefulWidget {
  const WarehouseCountingScreen({Key? key}) : super(key: key);

  @override
  State<WarehouseCountingScreen> createState() =>
      _WarehouseCountingScreenState();
}

class _WarehouseCountingScreenState extends State<WarehouseCountingScreen> {
  List<Warehouse> warehouseList = DummyData().items;
  TextEditingController intialdateval = TextEditingController();
  TextEditingController textEditingController = new TextEditingController();
  String _scanBarcode = '';
  late List<String> _barcodeList;

  Warehouse? _selectedWarehouse;

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2030),
    );
    if (picked != null) {
      setState(() => {intialdateval.text = picked.toString()});
    }
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    while (true) {
      try {
        barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Vazgeç', true, ScanMode.QR);
        _barcodeList.add(barcodeScanRes);
        debugPrint("Okunan barkod sayısı : ${_barcodeList.length}");
        //textEditingController.text = barcodeScanRes;
      } on PlatformException {
        barcodeScanRes = 'Failed to get platform version.';
      }

      if (!mounted) return;

      setState(() {
        _scanBarcode = barcodeScanRes;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.text = _scanBarcode;
    _scanBarcode = 'Unknown';
    _barcodeList = [];
    intialdateval.text = DateTime.now().toUtc().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(15, 101, 135, 1),
        title: Text('Stok Sayım'),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "İşlem Tarihi",
              style: TextStyle(fontSize: 16),
            ),
            TextFormField(
              autocorrect: false,
              controller: intialdateval,
              onSaved: (value) {},
              onTap: () {
                _selectDate();
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              maxLines: 1,
              validator: (value) {},
              decoration: InputDecoration(
                labelText: 'Tarih seçin.',
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),
            Text("Depolar"),
            DropdownButton<Warehouse>(
              value: _selectedWarehouse,
              onChanged: (value) {
                setState(() {
                  _selectedWarehouse = value;
                  debugPrint(_selectedWarehouse!.name);
                });
              },
              hint: Text(
                "Depo Seçin",
              ),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
              isExpanded: true,
              items: warehouseList
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Container(
                        child: Text(
                          e.name,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            ElevatedButton(
              onPressed: () => scanBarcodeNormal(),
              child: Text("Sayıma Başla"),
            )
          ],
        ),
      ),
    );
  }
}
