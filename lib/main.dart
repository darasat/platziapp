import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platziapp/screens/screens_list.dart';

void main() {
  runApp(const MyApp(
    key: Key("MyApp"),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Platzi Shop",
      locale: Get.deviceLocale,
      getPages: [
        GetPage(
          name: "/",
          page: () => Screens.splash,
        ),
      ],
    );
  }
}
