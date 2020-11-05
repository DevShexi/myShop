import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'socialLogin.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
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
      validators: validators,
    ),
  );
}

class _LoginState extends State<Login> {
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
                    Container(
                      height: 80,
                      //color: Colors.amber,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                        color: primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text('Please Login to your Account'),
                    SizedBox(height: 64),
                    FormBuilder(
                      key: _key,
                      child: Column(
                        children: [
                          _textField(
                            'email',
                            'Enter Your Email',
                            primary,
                            [
                              FormBuilderValidators.email(),
                              FormBuilderValidators.required(),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print('User forgot his password');
                                },
                                child: Text(
                                  'Forgot Your Password?',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: RaisedButton(
                              color: primary,
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                if (_key.currentState.saveAndValidate()) {
                                  print('Login Successful');
                                  // setState(() {
                                  //   username = _key.currentState
                                  //       .fields['username'].currentState.value;
                                  //   password = _key.currentState
                                  //       .fields['password'].currentState.value;
                                  // });
                                  // setState(() {
                                  //   requestedLogin = true;
                                  // });
                                  // // Navigator.pushNamed(
                                  // //     context, '/readQuran');

                                  // _getAndSaveToken(); //has to be called to authenticate login
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
                              googleLoginBtn
                            ],
                          ),
                          SizedBox(height: 56),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Dont Have an Account?  ',
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print('User Wants to register');
                                      Navigator.popAndPushNamed(
                                          context, '/signup');
                                    },
                                    child: Text(
                                      'Register',
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
