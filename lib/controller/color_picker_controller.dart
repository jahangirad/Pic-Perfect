import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class ColorPickerController extends GetxController {
  Color _color = Colors.blue; // Default color
  String _hexColor = '#0000FF'; // Default HEX color

  Color get color => _color; // Getter to access the color outside the controller
  String get hexColor => _hexColor; // Getter to access the HEX color

  Future<void> pickColor(BuildContext context) async {
    Color color = await showColorPickerDialog(
      context,
      _color,
      title: Text('Pick a color'),
      showColorCode: true, // Enable color code display
      colorCodeHasColor: true, // Color the code text with the selected color
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: true,
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
        ColorPickerType.bw: false,
      },
      enableOpacity: false, // Disable opacity slider if not needed
    );

    _color = color;
    _hexColor = '#${_color.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}'; // Convert to HEX
    update(); // Notify the listeners to rebuild the UI

    print(_hexColor); // Print the HEX color
  }
}
