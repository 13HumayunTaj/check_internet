// Dart Packages
import 'dart:async';

// Flutter Packages
import 'package:flutter/material.dart';

// This Package
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'package:get/get.dart';

import 'InternetConnectionController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internet Connection Checker Plus Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Internet Connection Checker Plus Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final InternetConnectionController internetConnectionController =
      Get.put(InternetConnectionController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    internetConnectionController.startInternetCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                internetConnectionController.checkInternetConnection();
              },
              child: Text(
                'Checking',
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Obx(
              () => Text(
                  internetConnectionController.netStatus.toString() == '0'
                      ? 'not connected'
                      : 'connected'),
            ),
          ],
        ),
      ),
    );
  }
}
