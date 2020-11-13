import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Common/socialLoginButtons.dart';
import 'model.dart';
import '../../../FormBuilder/CustomFormBuilder.dart';

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
                        children: getFields(signupModel, _key, context),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'SKIP',
                            ),
                          ),
                        )
                      ],
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
