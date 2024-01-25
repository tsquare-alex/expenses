part of 'bmi_calculator_widgets_imports.dart';

class BuildBMICalculatorButton extends StatelessWidget {
  const BuildBMICalculatorButton({Key? key, required this.data}) : super(key: key);
  final BMICalculatorData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.r),
      child: DefaultButton(
        onTap: ()=>data.calculateBMI(),
        title: tr(context, "calculate"),
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
      ),
    );
  }
}
