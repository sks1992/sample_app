import 'package:get/get.dart';
import 'package:sample_app/core/controllers/auth_controller.dart';
import 'package:sample_app/core/services/auth_services.dart';
import 'package:sample_app/core/services/shared_pref_service.dart';
import 'package:sample_app/core/services/url_services.dart';

class InitBinging extends Bindings {
  @override
  void dependencies() {
    Get.put(UrlServices());
    Get.put(SharedPrefService());
    Get.put(AuthService(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}
