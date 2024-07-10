import 'package:flutter/cupertino.dart';
import 'package:samplep/repository/auth_repository.dart';
import 'package:samplep/utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data,BuildContext context) async{
    setLoading(true);
    _myRepo.loginApi(data).then((val){
      Navigator.pushNamed(context, RoutesName.home);
      setLoading(false);
    }).onError((e,s){
      setLoading(false);
    });
  }

  Future<void> registerApi(dynamic data,BuildContext context) async{
    setLoading(true);
    _myRepo.registerApi(data).then((val){
      Navigator.pushNamed(context, RoutesName.home);
      setLoading(false);
    }).onError((e,s){
      setLoading(false);
    });
  }
}