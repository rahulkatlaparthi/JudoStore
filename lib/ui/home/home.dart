import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:july_18_flutter/storage/data-preferences.dart';
import 'package:july_18_flutter/ui/custom-views/MyAppBar.dart';
import 'package:july_18_flutter/ui/home/home-controller.dart';
import 'package:july_18_flutter/ui/login/login-screen.dart';
import 'package:july_18_flutter/utils/ui-helper.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());
  final dataPreference = Get.put(DataPreferences());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((duration) {
      homeController.fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: 'Products',
        actions: [InkWell(
            onTap: (){
              dataPreference.deletePreferences();
              Get.off(LoginScreen());
            },
            child: Icon(Icons.logout))],
      ),
      body: Center(
        child: Obx(() => ListView.builder(
            itemCount: homeController.userList.length,
            itemBuilder: (_, i) {
              return ListTile(
                onTap: () {
                  showProgressDialog();
                },
                title: Text(homeController.userList[i].productName ?? ''),
              );
            })),
      ),
    );
  }
}
