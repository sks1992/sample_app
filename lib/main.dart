import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/app_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppRoute.route,
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.registration,
    );
  }
}
