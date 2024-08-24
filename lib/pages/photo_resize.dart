import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/image_picker_controller.dart';
import '../utils/colors_code.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_container.dart';

class PhotoEnhancer extends StatelessWidget {
  PhotoEnhancer({super.key});

  final ImagePickerController getImage = Get.put(ImagePickerController());

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
              Obx(() {
                if (getImage.imagePath.value != null) {
                  return Container(
                    height: Get.height * .4,
                    width: Get.width * .7,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: ColorsCode.container_color),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: FileImage(File(getImage.imagePath.value)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: Get.height * .4,
                    width: Get.width * .7,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: ColorsCode.container_color),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: Colors.grey[300], // Placeholder background
                    ),
                    child: Center(
                      child: Text(
                        "No Image Selected",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                  );
                }
              }),
              SizedBox(height: Get.height * .05),
              GestureDetector(
                onTap: () {
                  getImage.pickImage();
                },
                child: CustomContainer("Image Picker", 16.0, FontWeight.w400),
              ),
              SizedBox(height: Get.height * .02),
              GestureDetector(
                onTap: () {
                  Get.toNamed("PhotoEnhancerDownload");
                },
                child: CustomContainer("Submit", 16.0, FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
