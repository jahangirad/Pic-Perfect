import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pic_perfect/widgets/custom_text.dart';
import '../utils/colors_code.dart';


Container CustomContainer(String text, double size, FontWeight textWeight){
  return Container(
    height: Get.height * .07,
    width: Get.width,
    decoration: BoxDecoration(
      color: ColorsCode.button_bg_color,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: Center(
      child: FittedBox(
          child: CustomText(text, size, textWeight, ColorsCode.container_text_color)
      ),
    ),
  );
}


Container CustomContainerB(String text){
  return Container(
    height: Get.height * .07,
    width: Get.width,
    decoration: BoxDecoration(
      border: Border.all(width: 2, color: ColorsCode.container_color),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: Center(
      child: FittedBox(
          child: CustomText(text, 16.0, FontWeight.w400, ColorsCode.container_text_color)
      ),
    ),
  );
}


Container CustomContainerP(){
  return Container(
    height: Get.height * .4,
    width: Get.width * .7,
    decoration: BoxDecoration(
      border: Border.all(width: 2, color: ColorsCode.container_color),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    // child: Center(
    //   child: FittedBox(
    //       child: CustomText(text, 16.0, FontWeight.w400, ColorsCode.container_text_color)
    //   ),
    // ),
  );
}
