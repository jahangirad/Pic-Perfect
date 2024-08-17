import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/bg_download_controller.dart';
import '../controller/bg_remove_controller.dart';
import '../utils/colors_code.dart';
import '../utils/images.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_container.dart';



class BgRemoveDownload extends StatelessWidget {
  BgRemoveDownload({super.key});

  final BgRemoveController bgRemoveDownload = Get.put(BgRemoveController());
  final BgDownloadController bgDownload = Get.put(BgDownloadController());

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
              Container(
                height: Get.height * .4,
                width: Get.width * .7,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: ColorsCode.container_color),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                    image: bgRemoveDownload.processedImage != null
                        ? MemoryImage(bgRemoveDownload.processedImage!)
                        : AssetImage(ImageForApp.app_icon) as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: Get.height * .05),
              Obx(() {
                return bgDownload.isLoading.value
                    ? CircularProgressIndicator() // Show progress indicator
                    : GestureDetector(
                  onTap: () {
                    bgDownload.downloadImage();
                  },
                      child: CustomContainer("Download", 16.0, FontWeight.w400),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
