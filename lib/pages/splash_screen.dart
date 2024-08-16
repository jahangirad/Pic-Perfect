import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pic_perfect/utils/images.dart';
import '../utils/colors_code.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    Timer(Duration(seconds: 3), (){
      Get.toNamed("LoginAndSignup");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            color: ColorsCode.splash_bg_color,
            image: DecorationImage(
                image: AssetImage(ImageForApp.app_icon)
            )
        ),
      ),
    );
  }
}
