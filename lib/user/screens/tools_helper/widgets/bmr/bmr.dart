import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../general/themes/app_colors.dart';
import '../../../../../general/themes/cubit/app_theme_cubit.dart';
import '../../../../../general/widgets/DefaultButton.dart';
import 'bmr_cubit.dart';

class BmrCalculatorScreen extends StatefulWidget {
  @override
  _BmrCalculatorScreenState createState() => _BmrCalculatorScreenState();
}

class _BmrCalculatorScreenState extends State<BmrCalculatorScreen> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String selectedGender = 'male'; // Default value, assuming "male" is the first item in your types list
  List<String> types = [
    "male",
    "feMale",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            :MyColors.white,

        title: MyText(
          title: tr(context, "bmr"),
          color:context.watch<AppThemeCubit>().isDarkMode
              ? MyColors.white
              :MyColors.black,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<BmrCubit, double>(
          builder: (context, bmr) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: tr(context, "enterWeight")),
                  ),
                  TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: tr(context, "enterHeight")),
                  ),
                  TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: tr(context, "age")),
                  ),
                  DropdownButton<String>(
                    value: selectedGender,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedGender = newValue!;
                      });
                    },
                    items: types
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(tr(context, value)), // Use translation here
                      ),
                    )
                        .toList(),
                  ),
                  DefaultButton(
                    color:  context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.primary
                        : MyColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    title: '${tr(context, "calculate")}',
                    onTap: () {
                      context.read<BmrCubit>().calculateBmr(
                        weight: int.tryParse(weightController.text) ?? 0,
                        height: int.tryParse(heightController.text) ?? 0,
                        age: int.tryParse(ageController.text) ?? 0,
                        isMale: selectedGender == 'male', // Use the key directly
                      );
                    },
                  ),
                  if (bmr > 0.0)
                    Center(
                      child: Text(
                          '${tr(context, "result")}: ${bmr.toStringAsFixed(2)}'),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

