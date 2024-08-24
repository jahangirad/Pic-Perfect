import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/image_picker_controller.dart';
import '../controller/photo_resize_controller.dart';
import '../utils/colors_code.dart';
import '../utils/images.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_text.dart';




class PhotoEnhancerDownload extends StatelessWidget {
  PhotoEnhancerDownload({super.key});

  final PhotoResizeController photoResizeController = Get.put(PhotoResizeController());
  final ImagePickerController getImage = Get.put(ImagePickerController());
  final TextEditingController picHeight = TextEditingController();
  final TextEditingController picWidth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: Get.height * .4,
                  width: Get.width * .7,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: ColorsCode.container_color),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                      image: getImage.imagePath != null
                          ? FileImage(File(getImage.imagePath.value))
                          : const AssetImage(ImageForApp.app_icon) as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: Get.height * .05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText("Height: ", 16, FontWeight.w500, ColorsCode.container_text_color),
                    SizedBox(
                      height: Get.height * .05,
                      width: Get.width * .25,
                      child: TextFormField(
                        controller: picHeight,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          fillColor: ColorsCode.button_border_color,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: ColorsCode.button_border_color),
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: ColorsCode.button_border_color),
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                        ),
                      ),
                    ),
                    CustomText(" Width: ", 16, FontWeight.w500, ColorsCode.container_text_color),
                    SizedBox(
                      height: Get.height * .05,
                      width: Get.width * .25,
                      child: TextFormField(
                        controller: picWidth,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          fillColor: ColorsCode.button_border_color,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: ColorsCode.button_border_color),
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: ColorsCode.button_border_color),
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                        ),
                      ),
                    ),
                    CustomText(" PX", 16, FontWeight.w500, ColorsCode.container_text_color),
                  ],
                ),
                SizedBox(height: Get.height * .05),
                GestureDetector(
                  onTap: () async {
                    try {
                      if (getImage.imagePath.value != null && getImage.imagePath.value.isNotEmpty) {
                        int? height = int.tryParse(picHeight.text);
                        int? width = int.tryParse(picWidth.text);

                        if (height != null && width != null) {
                          File imageFile = File(getImage.imagePath.value);
                          await photoResizeController.compressAndSave(imageFile, height, width);
                        } else {
                          Get.snackbar('Invalid Input', 'Please enter valid numbers for height and width.',
                              snackPosition: SnackPosition.TOP);
                        }
                      } else {
                        Get.snackbar('No Image Selected', 'No image selected or invalid file path.',
                            snackPosition: SnackPosition.TOP);
                      }
                    } catch (e) {
                      Get.snackbar('Error', 'Error during image processing: $e',
                          snackPosition: SnackPosition.TOP);
                    }
                  },
                  child: Obx(() {
                    return photoResizeController.isDownloading.value
                        ? CircularProgressIndicator() // ডাউনলোডের সময় প্রগ্রেস ইন্ডিকেটর দেখাও
                        : CustomContainer("Download", 16.0, FontWeight.w400); // ডাউনলোডের সময় শেষ হলে বাটন দেখাও
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
