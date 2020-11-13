import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Common/socialLoginButtons.dart';
import 'model.dart';
import '../../../FormBuilder/CustomFormBuilder.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormBuilderState> _key = GlobalKey<FormBuilderState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String email;
  String password;
  @override
  initState() {
    fetchUser();
    super.initState();
  }

  fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email');
      password = prefs.getString('password');
    });
    print(prefs.toString());
    print('UserEmail: $email');
    print('UserPassword: $password');
  }

  _signIn(String _email, String _password) async {
    if (email == _email && password == _password) {
      print('Login Successful');
      Navigator.popAndPushNamed(context, '/home');
    } else {
      print('Login Failed');
      _key.currentState.reset();
    }
  }

  SocialLoginBtn facebookLoginBtn = new SocialLoginBtn(
    btnColor: Colors.white,
    icon: FontAwesomeIcons.facebook,
    onPressed: () {},
  );
  SocialLoginBtn googleLoginBtn = new SocialLoginBtn(
    btnColor: Colors.white,
    icon: FontAwesomeIcons.google,
    onPressed: () {},
  );
  @override
  Widget build(BuildContext context) {
    final Color primary = Theme.of(context).primaryColor;
    return Scaffold(
      key: _scaffoldKey,
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
                        children: getFields(loginModel, _key, context),
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
