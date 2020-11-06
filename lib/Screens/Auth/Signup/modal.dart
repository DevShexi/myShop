import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Map modal = {
  "fieldEntities": [
    {
      "padding": const EdgeInsets.symmetric(vertical: 5),
      "obscureText": false,
      "attribute": "username",
      "decoration": {
        "hint": "Enter User Name",
        "hintStyle": TextStyle(color: Colors.blueGrey[800]),
        "enabledBorder": OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[800]),
        ),
        "focusedBorder": OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[800]),
        ),
        "errorBorder": OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[800]),
        ),
        "focusedErrorBorder": OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[800]),
        ),
      },
      "validators": [
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(6),
      ]
    },
    {
      "padding": const EdgeInsets.symmetric(vertical: 5),
      "obscureText": false,
      "attribute": "email",
      "decoration": {
        "hint": "Enter Your Email",
        "hintStyle": TextStyle(color: Colors.blueGrey[800]),
        "enabledBorder": OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[800]),
        ),
        "focusedBorder": OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[800]),
        ),
        "errorBorder": OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[800]),
        ),
        "focusedErrorBorder": OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[800]),
        ),
      },
      "validators": [
        FormBuilderValidators.email(),
        FormBuilderValidators.required(),
      ]
    },
    {
      "padding": const EdgeInsets.symmetric(vertical: 5),
      "obscureText": true,
      "attribute": "password",
      "decoration": {
        "hint": "Enter Your Password",
        "hintStyle": TextStyle(color: Colors.blueGrey[800]),
        "enabledBorder": OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[800]),
        ),
        "focusedBorder": OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[800]),
        ),
        "errorBorder": OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[800]),
        ),
        "focusedErrorBorder": OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[800]),
        ),
      },
      "validators": [
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(6),
      ]
    }
  ],
  "actions": [
    {
      "width": double.infinity,
      "height": 55,
      "raisedButton": {
        "color": Colors.blueGrey[800],
        "name": 'LOGIN',
        "titleStyle": TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      },
    }
  ],
  "socialActions": [
    {
      "name": "Facebook Login",
      "color": Colors.blueGrey[800],
      "icon": FontAwesomeIcons.facebook,
    },
    {
      "title": "Google Login",
      "color": Colors.blueGrey[800],
      "icon": FontAwesomeIcons.google,
    },
  ],
  "toggleMessage": "Already have an account?",
  "toggleTarget": 'Login Here',
};
