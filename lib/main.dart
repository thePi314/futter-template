import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Skola',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class HomePageData {
  String? email;
  String? password;
  bool? remember;

  HomePageData(String? _email, String? _password, bool? _remember) {
    email = _email ?? "";
    password = _password ?? "";
    remember = _remember ?? false;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _obscured = false;

  String email = "";
  String password = "";
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 64, left: 32, right: 32),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 19, 128, 218),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "E-mail",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextField(
                obscureText: _obscured,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscured = !_obscured;
                        });
                      },
                      child: Icon(
                        _obscured
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: remember,
                        onChanged: (bool? value) {
                          setState(() {
                            remember = value ?? false;
                          });
                        }),
                    const Text("Remember")
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscured = !_obscured;
                        });
                      },
                      child: const Text("Forgot Password?"),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
