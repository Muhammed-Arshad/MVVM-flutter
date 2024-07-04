import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:samplep/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
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
                })
           ,
          ],
        ),
      ),
    );
  }
}
