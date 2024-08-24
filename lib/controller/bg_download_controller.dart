import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:pic_perfect/controller/bg_remove_controller.dart';

class BgDownloadController extends GetxController {
  final BgRemoveController bgRemoveController = Get.put(BgRemoveController());

  var isLoading = false.obs; // Observable to track loading state

  Future<void> downloadImage() async {
    try {
      isLoading(true); // Start loading

      // Get the download directory path
      final directory = Directory('/storage/emulated/0/Download');
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      // Create the file path in the download directory
      final imagePath = '${directory.path}/downloaded_image.png';
      final imageFile = File(imagePath);

      // Write image data to the file
      await imageFile.writeAsBytes(bgRemoveController.processedImage as Uint8List);

      // Provide feedback to the user
      Get.snackbar(
        'Success',
        'Image downloaded to Download directory',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to download image',
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e);
    } finally {
      isLoading(false); // Stop loading
    }
  }
}
