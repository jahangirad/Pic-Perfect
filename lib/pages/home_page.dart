import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pic_perfect/widgets/custom_container.dart';
import '../widgets/custom_appbar.dart';




class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Get.toNamed("BgRemove");
              },
                child: CustomContainerB("Background Remover")
            ),
            SizedBox(height: Get.height * .02,),
            GestureDetector(
              onTap: (){
                Get.toNamed("PhotoEnhancer");
              },
                child: CustomContainerB("Photo Enhancer")
            ),
          ],
        ),
      ),
    );
  }
}
