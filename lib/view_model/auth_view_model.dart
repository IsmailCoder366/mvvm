import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/data/network/network_api_service.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel extends ChangeNotifier{
  final _authRepo = AuthRepository();


  Future<void> loginApi(dynamic data, BuildContext context)async{

    _authRepo.loginApi(data).then((value){
        print('api hit');
    }).onError((error, stackTrace){
Utils.flushBarErrorMessage(error.toString(), context);

    });
  }
}