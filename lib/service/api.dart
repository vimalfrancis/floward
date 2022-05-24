import "package:dio/dio.dart";

class API {
  final String url =
      "https://my-json-server.typicode.com/SharminSirajudeen/test_resources/";
  Dio getDioInstance() {
    Dio dio = Dio();
    dio.interceptors.add(
      InterceptorsWrapper(onRequest: (options, handler) {
        options.headers["X-API-KEY"] = "";
        options.headers["Authorization"] = "";
        return handler.next(options);
      }, onResponse: (response, handler) {
        return handler.next(response);
      }, onError: (DioError e, handler) {
        return handler.next(e);
      }),
    );
    return dio;
  }
}
