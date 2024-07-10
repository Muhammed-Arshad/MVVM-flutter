import 'package:samplep/model/book_model.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import '../res/app_url.dart';

class HomeRepository{

  BaseApiServices _apiServices = NetworkApiServices();

  Future<BookModel> fetchBookList() async {
    try{

      dynamic response = await _apiServices.getGetApiResponse(AppUrl.bookUrl);

      return response = BookModel.fromJson(response);

    }catch(e){
      throw e;
    }
  }

}