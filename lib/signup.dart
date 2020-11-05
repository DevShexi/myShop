import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'socialLogin.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

_saveUser(String username, String email, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('username', username);
  prefs.setString('email', email);
  prefs.setString('password', password);
}

_textField(
  String attribute,
  String hintText,
  Color color,
  List<String Function(dynamic)> validators,
  bool obscure,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: FormBuilderTextField(
      obscureText: obscure,
      attribute: attribute,
      //initialValue: 'shexiakram@gmail.com',
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: color),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
      ),
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(32),
        FormBuilderValidators.minLength(2),
      ],
    ),
  );
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormBuilderState> _key = GlobalKey<FormBuilderState>();
  SocialLoginBtn facebookLoginBtn = new SocialLoginBtn(
      btnColor: Colors.white,
      icon: FontAwesomeIcons.facebook,
      onPressed: () {});
  SocialLoginBtn googleLoginBtn = new SocialLoginBtn(
      btnColor: Colors.white, icon: FontAwesomeIcons.google, onPressed: () {});
  @override
  Widget build(BuildContext context) {
    final Color primary = Theme.of(context).primaryColor;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create New Account',
                      style: TextStyle(
                        color: primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                        'Please enter the following details to create a new account'),
                    SizedBox(height: 64),
                    FormBuilder(
                      key: _key,
                      child: Column(
                        children: [
                          _textField(
                            'username',
                            'Enter User Name',
                            primary,
                            [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.min(6)
                            ],
                            false,
                          ),
                          _textField(
                            'email',
                            'Enter Your Email',
                            primary,
                            [
                              FormBuilderValidators.email(),
                              FormBuilderValidators.min(6)
                              //FormBuilderValidators.required(),
                            ],
                            false,
                          ),
                          _textField(
                            'password',
                            'Enter Your Password',
                            primary,
                            [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6),
                            ],
                            true,
                          ),
                          SizedBox(height: 10),
                          SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: RaisedButton(
                              color: primary,
                              child: Text(
                                'SIGNUP',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                if (_key.currentState.saveAndValidate()) {
                                  print('Signup Successful');
                                  String username, email, password;
                                  username = _key.currentState
                                      .fields['username'].currentState.value;
                                  email = _key.currentState.fields['email']
                                      .currentState.value;
                                  password = _key.currentState
                                      .fields['password'].currentState.value;
                                  print('UserName: $username');
                                  print('Email: $email');
                                  print('Password: $password');
                                  _saveUser(username, email, password);
                                  Navigator.pushNamed(context, '/home');
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'or sign in with:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              facebookLoginBtn,
                              SizedBox(width: 10),
                              googleLoginBtn,
                            ],
                          ),
                          SizedBox(height: 56),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Already Have an Account?  ',
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print('User Wants to Login');
                                      Navigator.popAndPushNamed(
                                          context, '/login');
                                    },
                                    child: Text(
                                      'Login Here',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Terms',
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
