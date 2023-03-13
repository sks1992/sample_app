import 'package:get/get.dart';
import 'package:sample_app/ui/screens/home_screen.dart';
import 'package:sample_app/ui/screens/login_screen.dart';
import 'package:sample_app/ui/screens/registration_screen.dart';

class RouteNames {
  static String login = "/login";
  static String registration = "/registration";
  static String home = "/home";
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
    GetPage(
      name: RouteNames.home,
      page: () => HomeScreen(),
    ),
  ];
}
