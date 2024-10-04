import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm_project/data/app_exception.dart';
import 'package:mvvm_project/data/network/base_api.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApi {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions('No Internet Connection');
    }
    return responseJson;
  }
}

dynamic returnResponse(http.Response response) {}
