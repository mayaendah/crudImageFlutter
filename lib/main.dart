import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uploadimage1/app/routes/app_pages.dart';
import 'package:uploadimage1/biodata/biodata_page.dart';
import 'package:uploadimage1/getimage/get_image.dart';
import 'package:uploadimage1/todo/home_page.dart';

import 'app/home_view.dart';
import 'app/load_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // title: "Application",
      // initialRoute: AppPages.INITIAL,
      // getPages: AppPages.routes,
      // debugShowCheckedModeBanner: false,
      // title: 'Todo App',
      // home: HomePage(),
      // home: BioPage(),
      home: GetImage(),
    );
  }
}
