import 'dart:async';
import 'dart:io';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pic_perfect/widgets/custom_appbar.dart';
import '../controller/bg_remove_controller.dart';
import '../controller/color_picker_controller.dart';
import '../controller/image_picker_controller.dart';
import '../utils/colors_code.dart';
import '../widgets/custom_container.dart';



class BgRemove extends StatefulWidget {
  const BgRemove({super.key});

  @override
  State<BgRemove> createState() => _BgRemoveState();
}

class _BgRemoveState extends State<BgRemove> {

  final ColorPickerController getColor = Get.put(ColorPickerController());
  final ImagePickerController getImage = Get.put(ImagePickerController());
  final BgRemoveController bgAll = Get.put(BgRemoveController());

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
              Obx((){
                return Container(
                  height: Get.height * .4,
                  width: Get.width * .7,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: ColorsCode.container_color),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(image: FileImage(File(getImage.imagePath.toString())), fit: BoxFit.cover)
                  ),
                );
              }),
              SizedBox(height: Get.height * .05,),
              GestureDetector(
                onTap: (){
                  getColor.pickColor(context);
                },
                  child: CustomContainer("Pick Color", 16.0, FontWeight.w400)
              ),
              GestureDetector(
                onTap: (){
                  getImage.pickImage();
                },
                  child: CustomContainer("Img", 16.0, FontWeight.w400)
              ),
              SizedBox(height: Get.height * .02,),
              GestureDetector(
                  onTap: (){
                    bgAll.removeBackgroundWithColor();
                    Timer(Duration(seconds: 10), (){
                      Get.toNamed("BgRemoveDownload");
                    });
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
