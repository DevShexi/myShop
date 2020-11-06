import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../socialLogin.dart';

getFields(model, formskey, context, scaffoldKey) {
  List<Widget> fields = [];
  model["fieldEntities"].forEach((entity) {
    fields.add(textField(entity));
  });
  model["actions"].forEach((action) {
    fields.add(formButton(action));
  });
  return fields;
}

// List action = [
//   {
//     "width": double.infinity,
//     "height": 55,
//     "raisedButton": {
//       "color": Colors.blueGrey[800],
//       "title": 'LOGIN',
//       "titleStyle": TextStyle(
//           color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
//     },
//   }
// ];

formButton(actions) {
  return SizedBox(
    width: actions['width'],
    height: actions['height'],
    child: RaisedButton(
      color: actions['raisedButton']['height'],
      child: Text('${actions['raisedButton']['name']}',
          style: actions['raisedButton']['titleStyle']),
      onPressed: () {},
    ),
  );
}

textField(fieldEntities) {
  fieldEntities.forEach((entity) => {
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: FormBuilderTextField(
            obscureText: entity['obscureText'],
            attribute: entity['attribute'],
            //initialValue: 'shexiakram@gmail.com',
            decoration: InputDecoration(
              hintText: entity['decoration']['hintText'],
              hintStyle: entity['decoration']['hintStyle'],
              enabledBorder: entity['decoration']['enabledBorder'],
              focusedBorder: entity['decoration']['focusedBorder'],
              errorBorder: entity['decoration']['errorBorder'],
              focusedErrorBorder: entity['decoration']['focusedErrorBorder'],
            ),
            validators: entity['validators'],
          ),
        )
      });
}

socialLogin(model) {
  return Column(
    children: [
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
          model['socailAction'].forEach(
            (action) => {
              SocialLoginBtn(
                btnColor: action['color'],
                icon: action['icon'],
                onPressed: () {},
              ),
              SizedBox(width: 10),
            },
          ),
        ],
      ),
      SizedBox(height: 56),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '${model['toggleMessage']}',
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${model['toggleTarget']}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Terms',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
