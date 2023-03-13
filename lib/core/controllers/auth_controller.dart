import 'package:get/get.dart';
import 'package:sample_app/app_route.dart';
import 'package:sample_app/core/services/shared_pref_service.dart';

class AuthController extends GetxController {
  final _sharedService = Get.find<SharedPrefService>();
  var loggedIn = false.obs;

  @override
  void onInit() {
    ever(loggedIn, fireRoute);
    super.onInit();
  }

  void fireRoute(bool isLogged) async {
    if (isLogged) {
      Get.offAllNamed(RouteNames.home);
    } else {
      Get.offAllNamed(RouteNames.login);
    }
  }

  Future logout() async {
    _sharedService.clearOnLogout();
    loggedIn.value = false;
  }
}
