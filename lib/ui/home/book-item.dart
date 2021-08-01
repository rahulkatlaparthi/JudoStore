import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:judostore/models/book.dart';
import 'package:judostore/storage/data-preferences.dart';
import 'package:judostore/utils/dio-utils.dart';

class BookItem extends StatelessWidget {
  final dataPreference = Get.find<DataPreferences>();

  BookItem({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: book.image != null
          ? CachedNetworkImage(
              imageUrl: getBaseUrl(dataPreference
                      .readPreference(dataPreference.kIpAddressKey)) +
                  book.image!,
              width: 20,
              height: 20,
            )
          : Container(
              width: 20,
              height: 20,
              color: Colors.grey,
            ),
      title: Text(book.title ?? 'Unknown'),
      subtitle: Text(book.author ?? ''),
    );
  }
}
