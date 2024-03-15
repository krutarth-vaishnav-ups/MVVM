abstract class BaseAPIService {

  Future<dynamic> getResponse(String url);

  Future<dynamic> postResponse(String url, dynamic data);

}