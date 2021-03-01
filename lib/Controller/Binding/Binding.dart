import 'package:get/get.dart';
import 'package:test_app/Controller/SocialController.dart';
import '../AuthController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    // Get.put<SocialController>(SocialController(), permanent: true);
  }
}
