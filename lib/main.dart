import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:judostore/network/dio-client.dart';
import 'package:judostore/repository/api-repository.dart';
import 'package:judostore/storage/data-preferences.dart';
import 'package:judostore/ui/home/home.dart';
import 'package:judostore/ui/login/login-screen.dart';

import 'ui/home/home-controller.dart';

Future<void> main() async {
  await GetStorage.init();
  Get.put(DataPreferences());
  Get.put(DioClient());
  Get.put(ApiRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Get.find<DataPreferences>().checkUserAlreadyExisted()
          ? HomeScreen()
          : LoginScreen(),
    );
  }
}
