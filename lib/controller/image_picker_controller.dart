import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';




class ImagePickerController extends GetxController {

  RxString imagePath = "".obs;

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagePath.value = pickedFile.path.toString();
      update(); // Notify the listeners to rebuild the UI
    }
  }
}
