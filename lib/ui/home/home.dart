import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:judostore/storage/data-preferences.dart';
import 'package:judostore/ui/custom-views/MyAppBar.dart';
import 'package:judostore/ui/home/bottom-widgets/explore-view.dart';
import 'package:judostore/ui/login/login-screen.dart';

import 'bottom-widgets/my-books.dart';
import 'home-controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());

  final dataPreference = Get.find<DataPreferences>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((duration) {
      homeController.fetchBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: 'Products',
        actions: [
          InkWell(
              onTap: () {
                dataPreference.deletePreferences();
                Get.off(() => LoginScreen());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.logout,
                  color: Colors.green,
                ),
              ))
        ],
      ),
      body: Container(
        child: Obx(() => IndexedStack(
              index: homeController.tabSelectedPosition,
              children: [
                ExploreView(),
                MyBooksView(),
              ],
            )),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (index) {
            homeController.isExplore = !homeController.isExplore;
            homeController.tabSelectedPosition = index;
          },
          currentIndex: homeController.tabSelectedPosition,
          items: homeController.bottomViews,
        ),
      ),
    );
  }
}
