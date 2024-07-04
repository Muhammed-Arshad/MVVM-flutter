

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samplep/utils/routes/routes_name.dart';
import 'package:samplep/view/home_screen.dart';

import '../../view/login_screen.dart';

class Routes{

  static MaterialPageRoute generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=> HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=> LoginScreen());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('No route'))));

    }
  }

}