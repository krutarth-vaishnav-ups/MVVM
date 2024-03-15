import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../resources/app_colors.dart';
import '../resources/components/round_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('SignUp', style: TextStyle(color: AppColors.blackColor),),
          centerTitle: true,
        ),

        body: SafeArea(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration:  const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.alternate_email)
                ),
                onFieldSubmitted: (value){
                  Utils.fieldFocusNode(context, emailFocusNode, passwordFocusNode);
                },
              ),

              ValueListenableBuilder(
                  valueListenable: _obscurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      focusNode: passwordFocusNode,
                      obscureText: value,
                      obscuringCharacter: '*',
                      decoration:  InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock_open_rounded),
                          suffixIcon: InkWell(
                              onTap: (){
                                _obscurePassword.value = !_obscurePassword.value;
                              },
                              child: Icon(
                                  _obscurePassword.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility
                              )
                          )
                      ),
                    );
                  }
              ),

              SizedBox(height: height * .05,),

              RoundButton(
                title: 'SignUp',
                loading: authViewModel.signUpLoading,
                onPressed: (){
                  if(_emailController.text.isEmpty){
                    Utils.flushBarErrorMessage(context, 'Please enter email');
                  }else if(_passwordController.text.isEmpty){
                    Utils.flushBarErrorMessage(context, 'Please enter password');
                  }else if(_passwordController.text.length < 6){
                    Utils.flushBarErrorMessage(context, 'Please enter 6 digit password');
                  }else {
                    Map data = {
                      "email" : _emailController.text.toString(),
                      "password" : _passwordController.text.toString()
                    };
                    authViewModel.signUpApi(context, data);
                    debugPrint("API Hit");
                  }
                },
              ),

              SizedBox(height: height * .02,),

              InkWell(
                onTap: (){
                  Navigator.pushReplacementNamed(context, RoutesName.login);
                },
                child: const Text('Already have an account? Login')
              )

            ],
          ),
        )
    );
  }
}
