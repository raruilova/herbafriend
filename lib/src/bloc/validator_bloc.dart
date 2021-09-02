import 'dart:async';

class Validators {
  final emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);
      if (regExp.hasMatch(data)) {
        sink.add(data);
      } else {
        sink.addError('El correo electrónico no es válido');
      }
    },
  );

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.length >= 5) {
        sink.add(data);
      } else {
        sink.addError('La contraseña debe tener al menos 5 caracteres');
      }
    },
  );

  final usernameValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.length >= 10) {
        sink.add(data);
      } else {
        sink.addError('El usuario debe tener al menos 10 caracteres');
      }
    },
  );
}