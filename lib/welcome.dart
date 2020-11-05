import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'socialLogin.dart';

class Welcome extends StatelessWidget {
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
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("images/abstract.png"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Shop',
                  style: TextStyle(
                    color: primary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24),
                Text('Wellcome to your all in one business manager App'),
                SizedBox(height: 64),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _button(
                      'LOGIN',
                      primary,
                      () {
                        print('Login Pressed');
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    _button(
                      'SIGNUP',
                      primary,
                      () {
                        print('SignUp Pressed');
                        Navigator.pushNamed(context, '/signup');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'or sign in with:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        facebookLoginBtn,
                        SizedBox(width: 10),
                        googleLoginBtn,
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _button(String label, Color color, Function function) {
    return Expanded(
      flex: 1,
      child: new FlatButton(
        height: 45,
        child: new Text(
          '$label',
          style: TextStyle(color: color),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: color,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        onPressed: function,
      ),
    );
  }
}
