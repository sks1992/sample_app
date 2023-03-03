import 'package:get/get.dart';
import 'package:sample_app/core/services/auth_services.dart';
import 'package:sample_app/core/services/url_services.dart';

class InitBinging extends Bindings {
  @override
  void dependencies() {
    Get.put(UrlServices());
    Get.put(AuthService(), permanent: true);
  }
}
