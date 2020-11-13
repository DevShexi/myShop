import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../Screens/Common/socialLoginButtons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

getFields(model, formskeys, context) {
  List<Widget> fields = [];
  model["fieldEntities"].forEach((entity) {
    fields.add(textField(entity));
  });
  model["actions"].forEach((action) {
    fields.add(formButton(action));
  });
  fields.add(socialLogin());
  fields.add(toggleText(model, context));
  return fields;
}

Widget formButton(actions) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: SizedBox(
      width: actions['width'],
      height: actions['height'],
      child: RaisedButton(
        color: actions['raisedButton']['color'],
        child: Text('${actions['raisedButton']['name']}',
            style: actions['raisedButton']['titleStyle']),
        onPressed: () {},
      ),
    ),
  );
}

Widget textField(entity) {
  return StreamBuilder(
      stream: entity['stream'],
      builder: (context, snapshot) {
        return Padding(
          padding: entity['padding'],
          child: FormBuilderTextField(
            onChanged: entity["onChanged"],
            obscureText: entity['obscureText'],
            attribute: entity['attribute'],
            //initialValue: entity['initialValue'],
            decoration: InputDecoration(
              labelText: entity['decoration']['labelText'],
              // labelStyle: entity['decoration']['labelText'],
              hintText: entity['decoration']['hintText'],
              errorText: snapshot.error,
              // hintStyle: entity['decoration']['hintStyle'],
              enabledBorder: entity['decoration']['enabledBorder'],
              focusedBorder: entity['decoration']['focusedBorder'],
              errorBorder: entity['decoration']['errorBorder'],
              focusedErrorBorder: entity['decoration']['focusedErrorBorder'],
            ),
            //validators: entity['validators'],
          ),
        );
      });
}

Widget socialLogin() {
  return Column(
    children: [
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
        children: [facebookLoginBtn, SizedBox(width: 10), googleLoginBtn],
      ),
      SizedBox(height: 56),
    ],
  );
}

Widget toggleText(model, context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Text(
            '${model["toggleText"]}',
          ),
          InkWell(
            onTap: () {
              model["toggleTarget"] == "Register"
                  ? Navigator.popAndPushNamed(context, '/signup')
                  : Navigator.popAndPushNamed(context, '/login');
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 8.0),
              child: Text(
                '${model["toggleTarget"]}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Terms',
          ),
        ),
      )
    ],
  );
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
