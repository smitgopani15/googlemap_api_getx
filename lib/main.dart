import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:googlemap_api_getx/screen/home/controller/home_controller.dart';
import 'package:googlemap_api_getx/screen/home/view/home_screen.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        'home_screen': (context) => HomeScreen(),
      },
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    Timer(
      Duration(seconds: 5),
      () async {
        var status = await Permission.location.status;
        if (await status.isDenied) {
          status = await Permission.location.request();
          if (status.isGranted) {
            Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high,
            );
            homeController.lat.value = position.latitude;
            homeController.long.value = position.longitude;
            Get.toNamed('home_screen');
          }
        }
      },
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                "assets/images/1.png",
                height: 100,
              ),
              Spacer(),
              Image.asset(
                "assets/images/2.png",
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
