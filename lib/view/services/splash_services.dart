import 'package:flutter/cupertino.dart';
import 'package:samplep/utils/routes/routes_name.dart';
import 'package:samplep/view_model/user_view_model.dart';

import '../../model/user_model.dart';

class SplashServices{

  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context){
    getUserData().then((val) async {

      if(val.token == 'null' || val.token == ''){
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      }else{
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }

    }).onError((e,s){

    });
  }

}