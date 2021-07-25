enum Method { GET, POST, PUT, DELETE }

extension MethodType on Method {
  String getValue() {
    return this.toString().split('.').last;
  }
}

const kDummyEndPoint = '/dummy';
const kLoginEndPoint = '/login';
const kRegisterEndPoint = '/register';
const kProductsEndPoint = '/productlist';
