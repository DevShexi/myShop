import 'dart:async';
import 'validators.dart';

class Bloc extends Object with Validators {
  final _userName = StreamController<String>.broadcast();
  final _email = StreamController<String>.broadcast();
  final _password = StreamController<String>.broadcast();

  Stream<String> get userName => _userName.stream.transform(validateUsername);
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Function(String) get changeUsername => _userName.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  dispose() {
    _userName.close();
    _email.close();
    _password.close();
  }
}

final bloc = new Bloc();
