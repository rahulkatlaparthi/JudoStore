import 'package:get/get.dart';
import 'package:july_18_flutter/models/product.dart';
import 'package:july_18_flutter/models/products-response.dart';
import 'package:july_18_flutter/network/dio-client.dart';
import 'package:july_18_flutter/utils/dio-utils.dart';

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

  Future<List<Product>> apiGetProducts(Map<String, dynamic> body) async {
    ProductsResponse? data = await dioClient.makeNetworkCall<ProductsResponse>(
        endPoint: kProductsEndPoint,
        method: Method.POST.getValue(),
        data: body,
        parse: (json) => ProductsResponse.fromJson(json));
    return data?.products ?? [];
  }
}
