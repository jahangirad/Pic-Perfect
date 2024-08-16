import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'color_picker_controller.dart';
import 'image_picker_controller.dart';

class BgRemoveController extends GetxController {
  ColorPickerController bgColor = Get.put(ColorPickerController());
  ImagePickerController imgPick = Get.put(ImagePickerController());

  final String apiKey = '7BbchguW69if1agaw1ZxDYvw'; // Ensure secure storage for API key
  Uint8List? _processedImage; // Processed image data

  Uint8List? get processedImage => _processedImage;

  Future<void> removeBackgroundWithColor() async {
    final url = Uri.parse('https://api.remove.bg/v1.0/removebg');
    final request = http.MultipartRequest('POST', url)
      ..headers['X-API-Key'] = apiKey
      ..files.add(await http.MultipartFile.fromPath('image_file', imgPick.imagePath.toString()))
      ..fields['bg_color'] = bgColor.hexColor; // Ensure HEX color format

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.toBytes();
        _processedImage = responseData;
        update(); // Notify UI to update
        print('Image processing successful.');
      } else {
        print('Error: ${response.statusCode}');
        _processedImage = null;
        update(); // Notify UI to update
      }
    } catch (e) {
      print('Exception: $e');
      _processedImage = null;
      update(); // Notify UI to update
    }
  }
}
