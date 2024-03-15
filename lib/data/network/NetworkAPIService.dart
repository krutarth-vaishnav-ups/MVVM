
import 'dart:convert';
import 'dart:io';

import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/BaseAPIService.dart';
import 'package:http/http.dart' as http;

class NetworkAPIService extends BaseAPIService {
  @override
  Future getResponse(String url) async {

    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);

    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;

  }

  @override
  Future postResponse(String url, dynamic data) async{

    dynamic responseJson;

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: data
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);

    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response){

    switch(response.statusCode){

      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());

      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error Occurred While Communicating With Server With Status Code ${response.statusCode}');

    }

  }

}