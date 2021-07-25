import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:july_18_flutter/network/dio-client.dart';
import 'package:july_18_flutter/repository/api-repository.dart';
import 'package:july_18_flutter/storage/data-preferences.dart';
import 'package:july_18_flutter/ui/home/home.dart';
import 'package:july_18_flutter/ui/login/login-screen.dart';

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
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Get.find<DataPreferences>().checkUserAlreadyExisted()
          ? HomeScreen()
          : LoginScreen(),
    );
  }
}
