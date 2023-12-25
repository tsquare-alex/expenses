import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'percentage_state.dart';

class PercentageCubit extends Cubit<double> {
  PercentageCubit() : super(0.0);

  void calculatePercentage({required double number, required double percentage}) {
    if (percentage >= 0 && percentage <= 100) {
      final double result = (percentage / 100) * number;
      emit(result);
    }
    // else {
    //   emit(0.0);
    // }
  }
}