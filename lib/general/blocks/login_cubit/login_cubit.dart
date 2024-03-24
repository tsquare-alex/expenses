import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/blocks/login_cubit/login_states.dart';
import 'package:expenses/general/helper/configration/CustomButtonAnimation.dart';
import 'package:expenses/general/helper/storage/Storage.dart';
import 'package:expenses/general/models/user_model/user_model.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  UsersModel? model;

  Future<void> signInAnonymously(BuildContext context) async {
    emit(LoginAnonymouslyLoadingState());
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      User? user = userCredential.user;

      // You can now use the user and its token as needed.
      String? token = await user!.getIdToken();
      print(token);
      await Storage.setSkipToken(token!);
      AutoRouter.of(context).push(HomeRoute(index: 1));
      emit(LoginAnonymouslySuccessState(token));
      print('Anonymous user signed in with UID: ${user.uid}');
      print('Token: $token');
    } catch (e) {
      print(e.toString());
      emit(LoginAnonymouslyErrorState(e.toString()));
    }
  }

  final GlobalKey<CustomButtonState> btnKey = GlobalKey();

  void userLogin({
    required String email,
    required String password,
  }) {
    print('Hello');
    btnKey.currentState!.animateForward();
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      emit(LoginSuccessState(value.user?.uid));
      btnKey.currentState!.animateReverse();
    }).catchError((error) {
      btnKey.currentState!.animateReverse();
      emit(LoginErrorState(error.toString()));
    });
  }
}
