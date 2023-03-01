import 'package:get/get.dart';
import 'package:sample_app/ui/screens/login_screen.dart';
import 'package:sample_app/ui/screens/registration_screen.dart';

class RouteNames {
  static String login = "/login";
  static String registration = "/registration";
}

class AppRoute {
  static final route = [
    GetPage(
      name: RouteNames.registration,
      page: () => RegistrationScreen(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => LoginScreen(),
    ),
  ];
}
