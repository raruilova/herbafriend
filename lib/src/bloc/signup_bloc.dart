import 'package:herbafriend/src/bloc/validator_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class SignUpBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _usernameController = BehaviorSubject<String>();

  Stream<String> get emailStream =>
      _emailController.stream.transform(emailValidator);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(passwordValidator);
  Stream<String> get usernameStream =>
      _usernameController.stream.transform(usernameValidator);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  Stream<bool> get formSingUpValidStream => Rx.combineLatest3(
      usernameStream, emailStream, passwordStream, (a, b, c) => true);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeUsername => _usernameController.sink.add;

  String get email => _emailController.value;
  String get password => _passwordController.value;
  String get username => _usernameController.value;

  dispose() {
    _emailController.close();
    _passwordController.close();
    _usernameController.close();
  }
}