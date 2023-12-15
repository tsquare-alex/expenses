part of 'bmi_calculator_widgets_imports.dart';

class BuildBMICalculatorInput extends StatelessWidget {
  const BuildBMICalculatorInput({Key? key, required this.data})
      : super(key: key);
  final BMICalculatorData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.r),
      child: Column(
        children: [
          MyText(
            title: "Enter your weight (kg)",
            color: MyColors.black,
            size: 16.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 10.h,
          ),
          GenericTextField(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            controller: data.weightController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.number,
            action: TextInputAction.next,
            validate: (value) {
              if (value!.isEmpty) {
                return 'Enter your Weight (kg)';
              }
            },
            label: "الوزن",
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          SizedBox(
            height: 15.h,
          ),
          MyText(
            title: "Enter your height (cm)",
            color: MyColors.black,
            size: 16.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 10.h,
          ),
          GenericTextField(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            controller: data.heightController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.number,
            action: TextInputAction.none,
            validate: (value) {
              if (value!.isEmpty) {
                return 'Enter your Height(cm)';
              }
            },
            label: "الطول",
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
        ],
      ),
    );
  }
}
