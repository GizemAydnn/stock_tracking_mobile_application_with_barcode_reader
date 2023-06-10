import 'package:flutter/material.dart';
import 'package:stoktakip/screens/account_screen.dart';
import 'package:stoktakip/screens/stok_takip.dart';
import 'package:stoktakip/screens/transaction_screen.dart';
import 'package:stoktakip/screens/warehouse_counting_screen.dart';
import 'package:stoktakip/screens/warehouse_screen.dart';
import '../widgets/ana_menu_parametrik.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(15, 101, 135, 1),
        title: Text("Stok Takip Uygulaması"),
      ),
      body: SafeArea(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(8),
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          crossAxisCount: 2,
          children: <Widget>[
            GestureDetector(
              onTap: () => debugPrint("hhhhh"),
              child: MenuCustomListItem(
                Color.fromRGBO(228, 237, 146, 1.0),
                Icon(
                  Icons.insert_chart_outlined,
                  size: 42,
                  color: Color.fromRGBO(34, 111, 142, 1),
                ),
                Text(
                  "GÖSTERGE PANELİ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(34, 111, 142, 1),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StokTakipScreen()),
                );
              },
              child: MenuCustomListItem(
                Color.fromRGBO(135, 176, 217, 1.0),
                Icon(
                  Icons.input_sharp,
                  size: 42,
                  color: Color.fromRGBO(15, 101, 135, 1),
                ),
                Text(
                  "GİRİŞ / ÇIKIŞ",
                  style: TextStyle(
                      fontSize: 18, color: Color.fromRGBO(15, 101, 135, 1)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TransactionScreen()),
                );
              },
              child: MenuCustomListItem(
                Color.fromRGBO(109, 175, 167, 1.0),
                Icon(
                  Icons.list_alt,
                  size: 42,
                  color: Color.fromRGBO(18, 90, 118, 1),
                ),
                Text(
                  "TÜM İŞLEMLER",
                  style: TextStyle(
                      fontSize: 18, color: Color.fromRGBO(18, 90, 118, 1)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WarehouseCountingScreen()),
                );
              },
              child: MenuCustomListItem(
                Color.fromRGBO(109, 175, 112, 1.0),
                Icon(
                  Icons.inventory_outlined,
                  size: 42,
                  color: Color.fromRGBO(12, 81, 106, 1),
                ),
                Text(
                  "STOK SAYIM",
                  style: TextStyle(
                      fontSize: 18, color: Color.fromRGBO(12, 81, 106, 1)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WarehouseScreen()),
                );
              },
              child: MenuCustomListItem(
                Color.fromRGBO(139, 210, 142, 1.0),
                Icon(
                  Icons.account_balance_outlined,
                  size: 42,
                  color: Color.fromRGBO(12, 81, 106, 1),
                ),
                Text(
                  "DEPOLAR",
                  style: TextStyle(
                      fontSize: 18, color: Color.fromRGBO(12, 81, 106, 1)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountScreen()),
                );
              },
              child: MenuCustomListItem(
                Color.fromRGBO(224, 175, 154, 1.0),
                Icon(
                  Icons.account_box,
                  size: 42,
                  color: Color.fromRGBO(12, 81, 106, 1),
                ),
                Text(
                  "HESABIM",
                  style: TextStyle(
                      fontSize: 18, color: Color.fromRGBO(12, 81, 106, 1)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
