import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService()
      : dio = Dio(BaseOptions(
            baseUrl:
                "http://ec2-54-226-151-184.compute-1.amazonaws.com:8080/api",
            receiveTimeout: Duration(milliseconds: 3000),
            sendTimeout: Duration(milliseconds: 3000)));

  Future<Response<dynamic>> getRequest(String url, [bool isAuth = false]) async {
    try {
      if (isAuth) {
        print("Authorization header is included.");
        return await dio.get(url, options: Options(headers: {"Authorization": ""}));
      } else {
        return await dio.get(url);
      }
    } catch (e) {
      print("Error making GET request: $e");
      throw e; 
    }
  }
  Future<Response<dynamic>> postRequest(String url,{bool isAuth = true,dynamic body}) async {
    try {
      if (isAuth) {
        print("Authorization header is included.");
        return await dio.post(url, options: Options(headers: {"Authorization": ""}));
      } else {
        return await dio.post(url);
      }
    } catch (e) {
      print("Error making GET request: $e");
      throw e; 
    }
  }
  Future<Response<dynamic>> putRequest(String url,{bool isAuth = true,dynamic body}) async {
    try {
      if (isAuth) {
        print("Authorization header is included.");
        return await dio.put(url, options: Options(headers: {"Authorization": ""}));
      } else {
        return await dio.put(url);
      }
    } catch (e) {
      print("Error making GET request: $e");
      throw e; 
    }
  }
  Future<Response<dynamic>> deleteRequest(String url, [bool isAuth = false]) async {
    try {
      if (isAuth) {
        print("Authorization header is included.");
        return await dio.delete(url, options: Options(headers: {"Authorization": ""}));
      } else {
        return await dio.delete(url);
      }
    } catch (e) {
      print("Error making GET request: $e");
      throw e; 
    }
  }
  
}
