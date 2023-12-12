part of 'bmi_calculator_imports.dart';

class BMICalculatorData{

  GenericBloc<double> bmiCubit = GenericBloc(0.0);

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double bmi = 0.0;

  calculateBMI() {
    double weight = double.tryParse(weightController.text)!;
    double height = double.tryParse(heightController.text)!;
    if (weight != null && height != null) {
      bmi = weight / ((height * height) / 10000);
      bmiCubit.onUpdateData(bmi);
    }
  }
}