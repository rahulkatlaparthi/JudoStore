import 'dart:math';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:judostore/models/book.dart';
import 'package:judostore/network/dio-client.dart';
import 'package:judostore/utils/dio-utils.dart';

class ApiRepository extends GetxController {
  final dioClient = Get.find<DioClient>();

  Future<int> apiCheckLogin(Map<String, dynamic> body) async {
    int? data = await dioClient.makeNetworkCall<int>(
        endPoint: kLoginEndPoint,
        method: Method.POST.getValue(),
        data: body,
        parse: (json) => null);
    return data ?? -1;
  }

  Future<int> apiRegisterUser(Map<String, dynamic> body) async {
    int? data = await dioClient.makeNetworkCall<int>(
        endPoint: kRegisterEndPoint,
        method: Method.POST.getValue(),
        data: body,
        parse: (json) => null);
    return data ?? -1;
  }

  Future<List<Book>> apiGetBooks(Map<String, dynamic> body) async {
    List<Book>? data = await dioClient.makeNetworkCall<List<Book>>(
        endPoint: kGetBooksEndPoint,
        method: Method.POST.getValue(),
        data: body,
        parse: (json) => List<Book>.from(json
            .cast<Map<String, dynamic>>()
            .map((itemsJson) => Book.fromJson(itemsJson))));
    return data ?? [];
  }

  Future<int> apiAddBook(Map<String, dynamic> body) async {
    int? data = await dioClient.makeNetworkCall<int>(
        endPoint: kAddBookEndPoint,
        method: Method.POST.getValue(),
        data: body,
        parse: (json) => null);
    return data ?? -1;
  }

  Future<int> apiAttachFile(String filePath, String mimeType) async {
    final formData = dio.FormData.fromMap({
      'file': await dio.MultipartFile.fromFile(filePath,
          filename: null,
          contentType: MediaType("image", "png"))
    });
    int? data = await dioClient.makeNetworkCall<int>(
        endPoint: kAttachmentEndPoint,
        method: Method.POST.getValue(),
        data: formData,
        headers: {"Content-Type": "multipart/form-data"},
        parse: (json) => null);
    return data ?? -1;
  }
}
