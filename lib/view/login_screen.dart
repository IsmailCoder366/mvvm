import 'package:flutter/material.dart';
import 'package:mvvm/res/components/roundButton.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(false);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool loading = false;


  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _obsecurePassword.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final _authView = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
              focusNode: emailFocus,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.alternate_email),
              ),
              onFieldSubmitted: (value){
                Utils.focusNode(context, emailFocus, passwordFocus);
              },
            ),
            SizedBox(height: 5,),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child){
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: value,
                    obscuringCharacter: '*',
                    focusNode: passwordFocus,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: (){
                           _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: value ? Icon(Icons.visibility_off_outlined) : Icon(Icons.visibility_outlined),
                        ),
                    ),

                  );
                }
            ),
            SizedBox(height: height * 0.1),
            Roundbutton(
              loading : loading,
              title: 'login',
              ontap: (){
                  if(_emailController.text.isEmpty){
                    Utils.flushBarErrorMessage('enter email', context);
                  }else if(_passwordController.text.isEmpty){
                    Utils.flushBarErrorMessage('enter password', context);
                  }else if(_passwordController.text.length < 6){
                    Utils.flushBarErrorMessage('password should be greatest than 6 digits', context);
                  }else {
                    Map data = {
                      'email' : _emailController.text.toString(),
                      'password' : _passwordController.text.toString(),
                    };
                    _authView.loginApi(data, context);
                  }
            },)

          ],
        ),
      ),
    );
  }
}
