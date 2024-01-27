part of 'bmi_calculator_widgets_imports.dart';

class BuildBMICalculatorResult extends StatelessWidget {
  const BuildBMICalculatorResult({Key? key, required this.data})
      : super(key: key);
  final BMICalculatorData data;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<double>, GenericState<double>>(
      bloc: data.bmiCubit,
      builder: (context, state) {
        return MyText(
          title: "${tr(context, "result")}: ${state.data.toStringAsFixed(2)}",
          color:context.watch<AppThemeCubit>().isDarkMode
              ? MyColors.white
              :MyColors.black,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        );
      },
    );
  }
}
