import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bmr_cubit.dart';

class BmrCalculatorScreen extends StatefulWidget {
  @override
  _BmrCalculatorScreenState createState() => _BmrCalculatorScreenState();
}

class _BmrCalculatorScreenState extends State<BmrCalculatorScreen> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primary,
        title: MyText(title: tr(context, "bmr"), color: Colors.white, size: 18.sp,fontWeight: FontWeight.bold,),
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
                    decoration: InputDecoration(labelText: 'Weight (kg)'),
                  ),
                  TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Height (cm)'),
                  ),
                  TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Age'),
                  ),
                  DropdownButton<String>(
                    value: selectedGender,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedGender = newValue!;
                      });
                    },
                    items: <String>['Male', 'Female']
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                        .toList(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<BmrCubit>().calculateBmr(
                        weight: int.tryParse(weightController.text) ?? 0,
                        height: int.tryParse(heightController.text) ?? 0,
                        age: int.tryParse(ageController.text) ?? 0,
                        isMale: selectedGender == 'Male',
                      );
                    },
                    child: Text('Calculate'),
                  ),
                  if (bmr > 0.0)
                    Center(
                      child: Text('BMR Result: ${bmr.toStringAsFixed(2)}'),
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
