import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors_code.dart';
import '../utils/images.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_text.dart';



class LoginAndSignup extends StatelessWidget {
  const LoginAndSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                    image: AssetImage(ImageForApp.app_icon),
                  height: Get.height * .2,
                  width: Get.width * .5,
                ),
                SizedBox(height: Get.height * .01,),
                FittedBox(
                    child: CustomText("Create Your Photo Perfect", 36.0, FontWeight.w600, ColorsCode.subTitle_color)
                ),
                SizedBox(height: Get.height * .05,),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    fillColor: ColorsCode.button_border_color,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsCode.button_border_color),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsCode.button_border_color),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: ColorsCode.button_border_color,
                    ),
                    hintText: "E-mail",
                    hintStyle: TextStyle(color: ColorsCode.button_border_color),
                    labelText: "E-mail",
                    labelStyle: TextStyle(color: ColorsCode.button_border_color),
                  ),
                ),
                SizedBox(height: Get.height * .02,),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    fillColor: ColorsCode.button_border_color,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsCode.button_border_color),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorsCode.button_border_color),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    prefixIcon: Icon(
                      Icons.password,
                      color: ColorsCode.button_border_color,
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: ColorsCode.button_border_color),
                    labelText: "Password",
                    labelStyle: TextStyle(color: ColorsCode.button_border_color),
                  ),
                ),
                SizedBox(height: Get.height * .05,),
                GestureDetector(
                    onTap: (){
                      Get.toNamed("HomePage");
                    },
                    child: CustomContainer("Login", 16.0, FontWeight.w400)
                ),
                SizedBox(height: Get.height * .02,),
                FittedBox(
                    child: CustomText("OR", 20.0, FontWeight.w600, ColorsCode.subTitle_color)
                ),
                SizedBox(height: Get.height * .02,),
                GestureDetector(
                  onTap: (){},
                    child: CustomContainer("Signup", 16.0, FontWeight.w400)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
