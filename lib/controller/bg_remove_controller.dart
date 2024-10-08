import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'color_picker_controller.dart';
import 'image_picker_controller.dart';

class BgRemoveController extends GetxController {
  ColorPickerController bgColor = Get.put(ColorPickerController());
  ImagePickerController imgPick = Get.put(ImagePickerController());

  final String apiKey = '7BbchguW69if1agaw1ZxDYvw'; // Your API key
  Uint8List? _processedImage; // Processed image data

  var isLoading = false.obs; // Observable to track loading state

  Uint8List? get processedImage => _processedImage;

  Future<void> removeBackgroundWithColor() async {
    try {
      isLoading(true); // Start showing progress indicator

      final url = Uri.parse('https://api.remove.bg/v1.0/removebg'); // API URL
      final request = http.MultipartRequest('POST', url)
        ..headers['X-API-Key'] = apiKey
        ..files.add(await http.MultipartFile.fromPath('image_file', imgPick.imagePath.toString()))
        ..fields['bg_color'] = bgColor.hexColor; // Send HEX color directly

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.toBytes();
        _processedImage = responseData;
        update(); // Notify UI to update
      } else {
        print('Error: ${response.statusCode}');
        _processedImage = null;
        update(); // Notify UI to update
      }
    } finally {
      isLoading(false); // Stop showing progress indicator
    }
  }
}
