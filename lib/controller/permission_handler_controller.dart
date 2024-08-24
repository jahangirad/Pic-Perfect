import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';



class PermissionHandlerController extends GetxController {
  Future<void> requestPermissions() async {
    // এখানে যেসব পারমিশন দরকার সেগুলো অ্যাড করুন
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.manageExternalStorage, // If using scoped storage
      Permission.camera, // If camera permission is required
    ].request();

    // Optional: যদি কোনো পারমিশন না দেয়, সেটি হ্যান্ডেল করুন
    statuses.forEach((permission, status) {
      if (status.isDenied || status.isPermanentlyDenied) {
        // পারমিশন না দিলে কি হবে তা হ্যান্ডেল করুন
        print('Permission $permission is denied');
      }
    });
  }
}
