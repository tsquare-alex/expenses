import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceTaxCubit extends Cubit<double> {
  ServiceTaxCubit() : super(0.0);

  void calculateServiceTax({required double number, required double taxRate}) {
    final double taxAmount = (taxRate / 100) * number;
    emit(taxAmount);
  }
}
