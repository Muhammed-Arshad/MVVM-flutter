import 'package:samplep/data/network/BaseApiServices.dart';
import 'package:samplep/data/network/NetworkApiServices.dart';
import 'package:samplep/res/app_url.dart';

class AuthRepository{

  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginUrl,data);

      return response;

    }catch(e){
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerUrl,data);

      return response;

    }catch(e){
      throw e;
    }
  }

}