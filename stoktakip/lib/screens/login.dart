import 'package:flutter/material.dart';
import 'package:stoktakip/screens/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  late String username;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(15, 101, 135, 1),
      body: SingleChildScrollView(
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://i.pinimg.com/originals/85/4e/a1/854ea155162eafcc4c6626245bbd97f2.png",
                width: 300,
                height: 300,
              ),
              const SizedBox(
                height: 30,
                width: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.white),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Kullanıcı Adı:",
                    contentPadding: EdgeInsets.only(left: 12),
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.white),
                child: TextField(
                  obscureText: true,
                  // true ise girilen yazıyı gizler. şifre gizlemede kullanılır.
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Parola:",
                    contentPadding: EdgeInsets.only(left: 12),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
                width: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text(
                  "Giriş Yap",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(160, 48),
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
