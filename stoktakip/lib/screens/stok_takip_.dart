import 'package:flutter/material.dart';



class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);


  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final List<String> _animals = ["DEPARTMAN1","DEPARTMAN2","DEPARTMAN3","DEPARTMAN4"];

  // the selected value
  String? _selectedAnimal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(135,194, 217, 1),
        title: const Text("STOK TAKİP"),
        toolbarHeight: 90,
      ),
      body:SafeArea(
        child: Column(
          children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 35.0,horizontal: 60.0),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          width: 280,height: 70,
          decoration: BoxDecoration(
              color: Color.fromRGBO(135,194, 217, 1),
              borderRadius: BorderRadius.circular(25)),
          child: DropdownButton<String>(
                value: _selectedAnimal,
                onChanged: (value) {
                  setState(() {
                    _selectedAnimal = value;
                  });
                },

                hint: const Center(
                    child: Text(
                      "Departman Seç",
                      style: TextStyle(color: Colors.white,fontSize: 23),
                    )),
                underline: Container(),
                dropdownColor: Color.fromRGBO(135,194, 217, 1),
                style: TextStyle(color: Colors.white),
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
                isExpanded: true,

                items: _animals
                    .map((e) => DropdownMenuItem(
                  value: e,
                  child: Container(
                    child: Text(
                      e,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ))
                    .toList(),
                // Customize the selected item
                selectedItemBuilder: (BuildContext context) => _animals
                    .map((e) => Center(
                  child: Text(
                    e,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ))
                    .toList(),
              ),

            ),
          ],
        ),


      ),
      );
  }
}




















