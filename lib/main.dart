import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/bg_remove.dart';
import 'pages/bg_remove_download.dart';
import 'pages/home_page.dart';
import 'pages/login_and_signup.dart';
import 'pages/photo_enhancer.dart';
import 'pages/photo_enhancer_download.dart';
import 'pages/splash_screen.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pic Perfect",
      initialRoute: "SplashScreen",
      routes: {
        'SplashScreen': (context) => SplashScreen(),
        'LoginAndSignup': (context) => LoginAndSignup(),
        'HomePage': (context) => HomePage(),
        'BgRemove': (context) => BgRemove(),
        'PhotoEnhancer': (context) => PhotoEnhancer(),
        'BgRemoveDownload': (context) => BgRemoveDownload(),
        'PhotoEnhancerDownload': (context) => PhotoEnhancerDownload(),
      },
    );
  }
}