
import 'package:flutter/material.dart';
import 'package:pic_perfect/widgets/custom_text.dart';
import '../utils/colors_code.dart';

AppBar CustomAppbar(){
  return AppBar(
    automaticallyImplyLeading: false,
    title: CustomText("Pic Perfect", 20.0, FontWeight.w600, ColorsCode.container_text_color),
    centerTitle: true,
    backgroundColor: ColorsCode.appbar_color
  );
}