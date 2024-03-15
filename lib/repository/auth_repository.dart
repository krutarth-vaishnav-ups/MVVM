

import 'package:mvvm/data/network/BaseAPIService.dart';
import 'package:mvvm/data/network/NetworkAPIService.dart';
import 'package:mvvm/resources/app_end_points.dart';

class AuthRepository {

  final BaseAPIService _apiService = NetworkAPIService();

  Future<dynamic> loginApi(dynamic data) async {

    try {
      dynamic response = await _apiService.postResponse(AppAPIUrls.loginUrl, data);
      return response;
    } catch (e){
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {

    try {
      dynamic response = await _apiService.postResponse(AppAPIUrls.registerUserUrl, data);
      return response;
    } catch (e){
      throw e;
    }
  }

}