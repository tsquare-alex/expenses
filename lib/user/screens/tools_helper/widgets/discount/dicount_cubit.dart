import 'package:bloc/bloc.dart';
import 'package:expenses/user/screens/tools_helper/widgets/discount/discount_state.dart';

class DiscountCubit extends Cubit<DiscountState> {
  DiscountCubit() : super(DiscountState(0.0, false));

  void calculateDiscount({required double number, required double discountPercentage}) {
    double discountedAmount = number - (number * (discountPercentage / 100));
    emit(DiscountState(discountedAmount, true));
  }
}