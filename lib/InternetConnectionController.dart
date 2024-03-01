import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class InternetConnectionController extends GetxController {
  RxInt netStatus = 0.obs;

  void startInternetCheck() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      checkInternetConnection();
    });
  }

  Future<void> checkInternetConnection() async {
    try {
      final response = await http.get(Uri.parse('https://www.google.com'));

      if (response.statusCode == 200) {
        print('Connected to the internet');
        netStatus.value = 1; // Set netStatus to 1 when connected
      } else {
        print('No internet connection');
        netStatus.value = 0; // Set netStatus to 0 when not connected
      }
    } catch (e) {
      print('Error checking internet connection: $e');
      netStatus.value = 0; // Set netStatus to 0 on error
    }
  }
}
