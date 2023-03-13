import 'package:get/get.dart';
import 'package:sample_app/core/controllers/auth_controller.dart';

class HomeController extends GetxController {
  final _auth = Get.find<AuthController>();

  void logout() {
    _auth.logout();
  }
}
