import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

class CalculatorScreen extends StatelessWidget {
  double? _currentValue = 0;

  CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyText(title: tr(context, "calculator"), color: Colors.white, size: 15.sp,fontWeight: FontWeight.bold,),
        backgroundColor: Colors.blue,
      ),
      body: SimpleCalculator(
        value: _currentValue!,
        hideExpression: false,
        hideSurroundingBorder: true,
        autofocus: true,
        onChanged: (key, value, expression) {
          // Handle onChanged as needed
        },
        onTappedDisplay: (value, details) {
          // Handle onTappedDisplay as needed
        },
        theme: const CalculatorThemeData(
          borderColor: Colors.black,
          borderWidth: 2,
          displayColor: Colors.black,
          displayStyle: TextStyle(fontSize: 80, color: Colors.yellow),
          expressionColor: Colors.indigo,
          expressionStyle: TextStyle(fontSize: 20, color: Colors.white),
          operatorColor: Colors.blue,
          operatorStyle: TextStyle(fontSize: 30, color: Colors.white),
          commandColor: Colors.orange,
          commandStyle: TextStyle(fontSize: 30, color: Colors.white),
          numColor: Colors.grey,
          numStyle: TextStyle(fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }
}