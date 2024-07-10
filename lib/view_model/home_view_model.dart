import 'package:flutter/cupertino.dart';
import 'package:samplep/data/response/api_response.dart';
import 'package:samplep/model/book_model.dart';
import 'package:samplep/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier{

  final _myRepo = HomeRepository();

  ApiResponse<BookModel> bookList = ApiResponse.loading();

  setBookList(ApiResponse<BookModel> response){
    bookList = response;
    notifyListeners();
  }

  Future<void> fetchBookListApi() async{

    setBookList(ApiResponse.loading());

    _myRepo.fetchBookList().then((val){
      setBookList(ApiResponse.completed(val));
    }).onError((e,s){

      setBookList(ApiResponse.error(e.toString()));

    });

  }

}