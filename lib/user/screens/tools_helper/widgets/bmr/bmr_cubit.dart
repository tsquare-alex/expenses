import 'package:bloc/bloc.dart';

class BmrCubit extends Cubit<double> {
  BmrCubit() : super(0.0);

  void calculateBmr({required int weight, required int height, required int age, required bool isMale}) {
    final double bmr = isMale
        ? 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)
        : 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);

    emit(bmr);
  }
}