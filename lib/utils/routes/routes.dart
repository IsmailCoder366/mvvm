import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginScreen());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('no route defined'),
            ),
          );
        });
    }
  }
}