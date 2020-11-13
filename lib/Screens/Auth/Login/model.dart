import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'loginBloc.dart';

//This is the Model for Login Screen
Map loginModel = {
  "fieldEntities": [
    {
      "stream": bloc.email,
      "onChanged": bloc.changeEmail,
      "padding": const EdgeInsets.symmetric(vertical: 5),
      "obscureText": false,
      "attribute": "email",
      'initialValue': 'shexiakram@gmail.com',
      "decoration": {
        "labelText": "Email",
        "labelStyle": TextStyle(color: Colors.blueGrey[300]),
        "hintText": "email@example.com",
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
      "stream": bloc.password,
      "onChanged": bloc.changePassword,
      "padding": const EdgeInsets.symmetric(vertical: 5),
      "obscureText": true,
      "attribute": "password",
      'initialValue': '123456',
      "decoration": {
        "labelText": "Password",
        "labelStyle": TextStyle(color: Colors.blueGrey[300]),
        "hintText": "Atleast 6 characters",
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
      "height": 55.0,
      "raisedButton": {
        "color": Colors.blueGrey[800],
        "name": 'LOGIN',
        "titleStyle": TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      },
    }
  ],
  "toggleText": "Don't have an account?",
  "toggleTarget": "Register"
};
