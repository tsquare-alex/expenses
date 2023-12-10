part of 'bmi_calculator_imports.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {

  BMICalculatorData data = BMICalculatorData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios,color: MyColors.white,),
        ),
        centerTitle: true,
        title: MyText(
          title: "BMI Calculator",
          color: MyColors.white,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildBMICalculatorInput(data: data,),
              BuildBMICalculatorButton(data: data,),
              BuildBMICalculatorResult(data: data,),

            ],
          ),
        ),
      ),
    );
  }
}
