import 'package:flutter/material.dart';

class TumIslemler extends StatefulWidget {
  const TumIslemler({Key? key}) : super(key: key);

  @override
  State<TumIslemler> createState() => _TumIslemlerState();
}

class _TumIslemlerState extends State<TumIslemler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(120, 174, 195, 1),
        title: Text("TÜM İŞLEMLER"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(

            ),
          ],
        ),
      ),
    );
  }
}
