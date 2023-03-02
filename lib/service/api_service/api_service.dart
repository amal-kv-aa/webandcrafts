import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  Future <List?> getEmployeesData() async {
    try {
      final response =
          await Dio().get('http://www.mocky.io/v2/5d565297300000680030a986');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log("success");
        return response.data;
      }
      return null;
    } on DioError catch (e) {
      log(e.message.toString());
      return null;
    }
  }
}
