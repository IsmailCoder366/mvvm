import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/data/network/network_api_service.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel extends ChangeNotifier{
  final _authRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool loading){
    _loading = loading;
  }


  bool _signUploading = false;
  bool get signUploading => _signUploading;
  setSignUpLoading(bool signUploading){
    _signUploading = signUploading;
  }


  Future<void> loginApi(dynamic data, BuildContext context)async{
setLoading(true);
    _authRepo.loginApi(data).then((value){
        print('api hit');
        setLoading(false);
    }).onError((error, stackTrace){
Utils.flushBarErrorMessage(error.toString(), context);
setLoading(false);
    });
  }
  Future<void> signUpApi(dynamic data, BuildContext context)async{
    setSignUpLoading(true);
    _authRepo.loginApi(data).then((value){
        print('api hit');
        setSignUpLoading(false);
    }).onError((error, stackTrace){
Utils.flushBarErrorMessage(error.toString(), context);
setSignUpLoading(false);
    });
  }
}