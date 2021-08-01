import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:judostore/models/book.dart';
import 'package:judostore/repository/api-repository.dart';
import 'package:judostore/storage/data-preferences.dart';
import 'package:judostore/utils/ui-helper.dart';

class HomeController extends GetxController {
  final apiRepository = Get.find<ApiRepository>();
  final dataPreference = Get.find<DataPreferences>();

  final _exploreBooksList = <Book>[].obs;

  List<Book> get exploreBooksList => _exploreBooksList;

  final _myBooksList = <Book>[].obs;

  List<Book> get myBooksList => _myBooksList;

  var _isExplore = true;

  bool get isExplore => _isExplore;

  set isExplore(bool value) {
    this._isExplore = value;
    fetchBooks();
  }

  final bottomViews = [
    BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
    BottomNavigationBarItem(icon: Icon(Icons.book), label: 'MyBooks')
  ];
  final _tabSelectedPosition = 0.obs;

  int get tabSelectedPosition => _tabSelectedPosition.value;

  set tabSelectedPosition(int value) {
    this._tabSelectedPosition.value = value;
  }

  void fetchBooks() async {
    final data = await apiRepository.apiGetBooks({
      "userid": dataPreference.readPreference(dataPreference.kUserKey),
      "isExplore": _isExplore
    });
    if (_isExplore) {
      _exploreBooksList.value = data;
      if (_exploreBooksList.isEmpty) {
        showAlertDialog(message: 'No items found.');
      }
    } else {
      _myBooksList.value = data;
      if (_myBooksList.isEmpty) {
        showAlertDialog(message: 'No items found.');
      }
    }
  }
}
