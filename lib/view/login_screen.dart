import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            // Named Routes
            // Navigator.pushNamed(context, RoutesName.home);

            // Utils
            Utils.toastMessage("message");
            Utils.flushBarErrorMessage(context, 'No Internet Connection');
            Utils.snackBar(context, 'No Internet Connection');
          },
          child: const Text('Click')
        ),
      )
    );
  }
}
