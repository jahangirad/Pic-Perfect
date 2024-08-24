import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:get/get.dart';
import 'package:path/path.dart' as path;

class PhotoResizeController extends GetxController {
  var isDownloading = false.obs;

  Future<File?> compressAndSave(File file, int width, int height) async {
    try {
      isDownloading.value = true;

      // ফাইল থেকে ইমেজ লোড করা
      List<int> imageBytes = await file.readAsBytes();

      // List<int> থেকে Uint8List এ কনভার্ট করা
      Uint8List uint8listImage = Uint8List.fromList(imageBytes);

      img.Image? image = img.decodeImage(uint8listImage);

      // ইমেজ সঠিকভাবে লোড হয়েছে কিনা তা নিশ্চিত করুন
      if (image == null) {
        Get.snackbar('Error', 'Failed to load image.', snackPosition: SnackPosition.TOP);
        isDownloading.value = false;
        return null;
      }

      // ইমেজ রিসাইজ করা
      img.Image resizedImage = img.copyResize(
        image,
        width: width, // ইচ্ছামত প্রস্থ নির্ধারণ করুন
        height: height, // ইচ্ছামত উচ্চতা নির্ধারণ করুন
      );

      // ডাউনলোডস ডিরেক্টরি পাওয়া
      final directory = Directory('/storage/emulated/0/Download');
      if (!await directory.exists()) {
        Get.snackbar('Error', 'Failed to get Downloads directory.', snackPosition: SnackPosition.TOP);
        isDownloading.value = false;
        return null;
      }

      // ইউনিক নাম তৈরি করা
      final fileName = 'resized_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final targetPath = path.join(directory.path, fileName);

      // রিসাইজ করা ইমেজটি সেভ করুন
      File resizedFile = File(targetPath)
        ..writeAsBytesSync(img.encodeJpg(resizedImage));

      Get.snackbar('Success', 'Image resized and saved to: ${resizedFile.path}', snackPosition: SnackPosition.TOP);
      isDownloading.value = false;
      return resizedFile;
    } catch (e) {
      Get.snackbar('Error', 'Error resizing image: $e', snackPosition: SnackPosition.TOP);
      isDownloading.value = false;
      return null;
    }
  }
}


