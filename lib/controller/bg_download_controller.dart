import 'dart:io';
import 'dart:typed_data';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'bg_remove_controller.dart';




class BgDownloadController extends GetxController {
  final BgRemoveController bgRemoveController = Get.find<BgRemoveController>();

  var isLoading = false.obs; // Observable to track loading state

  Future<void> downloadImage() async {
    try {
      isLoading(true); // Start loading

      // Temporary directory path
      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/downloaded_image.png';
      final imageFile = File(imagePath);

      // Write image data to file
      await imageFile.writeAsBytes(bgRemoveController.processedImage as Uint8List);

      // Save to gallery
      await GallerySaver.saveImage(imageFile.path);

      Get.snackbar('Success', 'Image downloaded to gallery',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error', 'Failed to download image',
          snackPosition: SnackPosition.BOTTOM);
      print(e);
    } finally {
      isLoading(false); // Stop loading
    }
  }
}
