import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samplep/utils/routes/routes_name.dart';

import '../res/components/round_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {


  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();


  @override
  Widget build(BuildContext context) {

    final _authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign Up'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              focusNode: emailFocus,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email)
              ),
              onFieldSubmitted: (val){
                Utils.fieldFocusChange(context, emailFocus, passFocus);
              },
            ),
            ValueListenableBuilder(valueListenable: _obsecurePassword,
                builder: (context, value,child){
                  return TextFormField(
                    focusNode: passFocus,
                    obscureText: _obsecurePassword.value,
                    obscuringCharacter: '*',
                    controller: _passwordController,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                            onTap: (){
                              _obsecurePassword.value = !_obsecurePassword.value;
                            },
                            child: _obsecurePassword.value?
                            Icon(Icons.visibility):Icon(Icons.visibility_off))
                    ),
                  );
                }),
            SizedBox(height: 50,),
            RoundButton(title: 'Login',
                loading: _authViewModel.loading,
                onPress: (){
                  if(_emailController.text.isEmpty){
                    Utils.flushBarErrorMsg('Enter email', context);
                  }else if(_passwordController.text.isEmpty){
                    Utils.flushBarErrorMsg('Enter Password', context);
                  }else if(_passwordController.text.length < 6){
                    Utils.flushBarErrorMsg('Password length must be more than 6', context);
                  }else{

                    Map data = {
                      'email': _emailController.text.trim(),
                      'password': _passwordController.text.toString()
                    };

                    _authViewModel.registerApi(data,context);
                  }
                }),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.login);
              },
              child: Text("Already have an account? Login"),
            )
            ,
          ],
        ),
      ),
    );
  }
}
