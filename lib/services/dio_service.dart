import 'dart:math';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;

class DioService {
  Dio dio = Dio();

  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-Type'] = 'application/json';
    return await dio.get(url, options: Options(responseType: ResponseType.json, method: 'GET')).then(
      (response) {
        // log(response.toString());
        return response;
      },
    );
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async{
    dio.options.headers['content-Type'] = 'application/json';
    //TODO read token fro storage
    return await dio.post(url,data:dio_service.FormData.fromMap(map),options: Options(
      responseType: ResponseType.json,
      method: 'POST',
    ) ).then((value) {
      print(value.headers.toString());
      print(value.data.toString());
      print(value.statusCode.toString());
      return value;
    },);
  }
}
