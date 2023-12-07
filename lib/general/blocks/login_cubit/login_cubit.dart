import 'package:expenses/general/blocks/login_cubit/login_states.dart';
import 'package:expenses/general/models/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context)=>BlocProvider.of(context);
  UsersModel? model;
  
  void userLogin({
    required String email,
    required String password,
  }) {
    print('Hello');
    emit(LoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      print(value.user?.email);
      print(value.user?.uid);

      emit(LoginSuccessState(value.user?.uid));

    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }


}