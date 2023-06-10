import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:stoktakip/contstants/data.dart';

class StokTakipScreen extends StatefulWidget {
  const StokTakipScreen({Key? key}) : super(key: key);

  @override
  State<StokTakipScreen> createState() => _StokTakipScreenState();
}

class _StokTakipScreenState extends State<StokTakipScreen> {
  TextEditingController textEditingController = new TextEditingController();
  TextEditingController intialdateval = TextEditingController();

  List<Warehouse> warehouseList = DummyData().items;

  String _scanBarcode = '';

  Warehouse? _selectedWarehouse;

  @override
  void initState() {
    super.initState();
    textEditingController.text = _scanBarcode;
    _scanBarcode = 'Unknown';
    intialdateval.text = DateTime.now().toUtc().toString();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> startBarcodeScanStream() async {
      FlutterBarcodeScanner.getBarcodeStreamReceiver(
              '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
          .listen((barcode) => print(barcode));
    }

    Future<void> scanQR() async {
      String barcodeScanRes;
      // Platform messages may fail, so we use a try/catch PlatformException.
      try {
        barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.QR);
        debugPrint(barcodeScanRes);
      } on PlatformException {
        barcodeScanRes = 'Failed to get platform version.';
      }

      // If the widget was removed from the tree while the asynchronous platform
      // message was in flight, we want to discard the reply rather than calling
      // setState to update our non-existent appearance.
      if (!mounted) return;

      setState(() {
        _scanBarcode = barcodeScanRes;
      });
    }

    Future<void> scanBarcodeNormal() async {
      String barcodeScanRes;
      try {
        barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Vazgeç', true, ScanMode.QR);
        textEditingController.text = barcodeScanRes;
      } on PlatformException {
        barcodeScanRes = 'Failed to get platform version.';
      }

      if (!mounted) return;

      setState(() {
        _scanBarcode = barcodeScanRes;
      });
    }

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

    final _formKey = GlobalKey<FormState>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 38,
          backgroundColor: Color.fromRGBO(15, 101, 135, 1),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Text("Giriş"),
              ),
              Tab(
                child: Text("Çıkış"),
              ),
            ],
          ),
          title: Text("Stok Takip"),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Text("Giriş"),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
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
                    Text(
                      "Ürün",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: IconButton(
                          onPressed: () => {scanBarcodeNormal()},
                          icon: Icon(Icons.camera),
                        ),
                      ),
                    ),
                    Text(
                      "İşlem Tipi",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Mevcut Stok",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Text(
                      "Stok Miktarı",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Örn: 5",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Text(
                      "Açıklama",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Örn: 21 inch",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
