
abstract class LoginStates {}

class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final String? uId;
  LoginSuccessState(this.uId);
}
class LoginErrorState extends LoginStates{
  final String error;
  LoginErrorState(this.error);
}

class LoginAnonymouslyLoadingState extends LoginStates{}
class LoginAnonymouslySuccessState extends LoginStates{
  final String? uId;
  LoginAnonymouslySuccessState(this.uId);
}
class LoginAnonymouslyErrorState extends LoginStates{
  final String error;
  LoginAnonymouslyErrorState(this.error);
}