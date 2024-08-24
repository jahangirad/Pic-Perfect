import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/permission_handler_controller.dart';
import 'pages/bg_remove.dart';
import 'pages/bg_remove_download.dart';
import 'pages/home_page.dart';
import 'pages/login_and_signup.dart';
import 'pages/photo_resize.dart';
import 'pages/photo_resize_download.dart';
import 'pages/splash_screen.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  PermissionHandlerController permissionHandlerController = Get.put(PermissionHandlerController());

  @override
  void initState() {
    permissionHandlerController.requestPermissions();
    super.initState();
  }

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