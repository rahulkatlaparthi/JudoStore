import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:judostore/models/book.dart';
import 'package:judostore/ui/add-book/add-book.dart';
import 'package:judostore/ui/home/book-item.dart';
import 'package:judostore/ui/home/home-controller.dart';

class MyBooksView extends StatelessWidget {
  MyBooksView({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
            itemCount: homeController.myBooksList.length,
            itemBuilder: (_, index) {
          Book book = homeController.myBooksList[index];
          return BookItem(book: book);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddBook())!.then((value) => homeController.fetchBooks());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
