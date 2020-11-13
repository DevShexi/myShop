import 'dart:async';

class Validators {
  final validateUsername = StreamTransformer<String, String>.fromHandlers(
      handleData: (userName, sink) {
    if (userName.length >= 4) {
      sink.add(userName);
    } else
      sink.addError('This Username is not available');
  });

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains('@')) {
        sink.add(email);
      } else
        sink.addError('Please enter a valid email address');
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else
      sink.addError('password must be atleast 6 characters long');
  });
}
