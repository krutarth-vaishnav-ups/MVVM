
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repository.dart';

import 'package:mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {

  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(BuildContext context, dynamic data) async{
    setLoading(true);

    _myRepo.loginApi(data).then((value){
      setLoading(false);

      Utils.flushBarSuccessMessage(context, 'Login Successful');
      // Navigator.pushNamed(context, RoutesName.home);

      if (kDebugMode) {
        print(value.toString());
      }

    }).onError((error, stackTrace){
      setLoading(false);

      if (kDebugMode) {
        Utils.flushBarErrorMessage(context, error.toString());
        print(error.toString());
      }

    });
  }

  Future<void> signUpApi(BuildContext context, dynamic data) async{
    setSignUpLoading(true);

    _myRepo.loginApi(data).then((value){
      setSignUpLoading(false);

      Utils.flushBarSuccessMessage(context, 'SignUp Successful');
      // Navigator.pushNamed(context, RoutesName.home);

      if (kDebugMode) {
        print(value.toString());
      }

    }).onError((error, stackTrace){
      setSignUpLoading(false);

      if (kDebugMode) {
        Utils.flushBarErrorMessage(context, error.toString());
        print(error.toString());
      }

    });
  }
}