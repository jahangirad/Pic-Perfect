import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_container.dart';




class PhotoEnhancer extends StatelessWidget {
  const PhotoEnhancer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              CustomContainerP(),
              SizedBox(height: Get.height * .05,),
              GestureDetector(
                  onTap: (){
                    Get.toNamed("PhotoEnhancerDownload");
                  },
                  child: CustomContainer("Submit", 16.0, FontWeight.w400)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
