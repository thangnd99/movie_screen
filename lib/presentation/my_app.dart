import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_page.dart';

/// MyApp
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      getPages: AppPage.routes,
    );
  }
}
