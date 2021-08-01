import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:judostore/models/book.dart';
import 'package:judostore/ui/home/home-controller.dart';
import 'package:judostore/utils/dio-utils.dart';

import '../book-item.dart';

class ExploreView extends StatelessWidget {
  ExploreView({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Obx(
            ()=> ListView.builder(
              itemCount: homeController.exploreBooksList.length,
              itemBuilder: (_, index) {
                Book book = homeController.exploreBooksList[index];
                return BookItem(book: book);
              }),
        ));
  }
}
