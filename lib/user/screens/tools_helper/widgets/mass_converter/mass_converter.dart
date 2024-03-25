import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../general/constants/MyColors.dart';
import '../../../../../general/themes/app_colors.dart';
import '../../../../../general/themes/cubit/app_theme_cubit.dart';
import '../../../../../general/widgets/DefaultButton.dart';

class MassConverterScreen extends StatefulWidget {
  @override
  _MassConverterScreenState createState() => _MassConverterScreenState();
}

class _MassConverterScreenState extends State<MassConverterScreen> {
  double inputValue = 1.0;
  String fromUnit = 'kg';
  String toUnit = 'g';
  String result = '';

  // void _performConversion() {
  //   try {
  //     double? convertedValue = convertMass(inputValue, fromUnit, toUnit);
  //     if (convertedValue != null) {
  //       setState(() {
  //         result = '${tr(context, "result")}: $convertedValue $toUnit';
  //       });
  //     } else {
  //       setState(() {
  //         result = 'Invalid conversion';
  //       });
  //     }
  //   } catch (e) {
  //     setState(() {
  //       result = 'Invalid input';
  //     });
  //   }
  // }
  Map<String, String> massUnitTranslations(BuildContext context) {
    return {
      'kg': tr(context, 'kilogram'),
      'hg': tr(context, 'hectogram'),
      'dag': tr(context, 'decagram'),
      'g': tr(context, 'gram'),
      'dg': tr(context, 'decigram'),
      'cg': tr(context, 'centigram'),
      'mg': tr(context, 'milligram'),
      'µg': tr(context, 'microgram'),
      'ng': tr(context, 'nanogram'),
      'Mg': tr(context, 'megagram'),
      'Gg': tr(context, 'gigagram'),
      'oz': tr(context, 'ounce'),
      'lb': tr(context, 'pound'),
      't': tr(context, 'tonne'),
      'long-ton': tr(context, 'long_ton'),
      'ton': tr(context, 'ton'),
      'short-ton': tr(context, 'short_ton'),
    };
  }

  void _performConversion() {
    try {
      double? convertedValue = convertMass(inputValue, fromUnit, toUnit);
      if (convertedValue != null) {
        setState(() {
          result = '${tr(context, "result")}: $convertedValue ${massUnitTranslations(context)[toUnit]}';
        });
      } else {
        setState(() {
          result = tr(context, 'invalidConversion');
        });
      }
    } catch (e) {
      setState(() {
        result = tr(context, 'invalidInput');
      });
    }
  }
  double? convertMass(double value, String fromUnit, String toUnit) {
    const Map<String, double> massConversionFactors = {
      'kg': 1.0,
      'hg': 0.1,
      'dag': 0.01,
      'g': 0.001,
      'dg': 0.0001,
      'cg': 0.01,
      'mg': 1e-6,
      'µg': 1e-9,
      'ng': 1e-12,
      'Mg': 1e3,
      'Gg': 1e6,
      'oz': 0.0283495,
      'lb': 0.453592,
      't': 1000.0,
      'long-ton': 1016.05,
      'ton': 907.185,
      'short-ton': 907.185,
    };

    if (fromUnit == toUnit) {
      return value;
    }

    return value * massConversionFactors[fromUnit]! / massConversionFactors[toUnit]!;
  }

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

        backgroundColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor:MyColors.white,
        title:MyText(title: tr(context, "convertMass"),
          color:context.watch<AppThemeCubit>().isDarkMode
              ? MyColors.white
              :MyColors.black,
          size: 18.sp,fontWeight: FontWeight.bold,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: tr(context, "enterValue")),
              onChanged: (value) {
                setState(() {
                  inputValue = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            // DropdownButton<String>(
            //   value: fromUnit,
            //   items: ['kg', 'hg', 'dag', 'g', 'dg', 'cg', 'mg', 'µg', 'ng', 'Mg', 'Gg', 'oz', 'lb', 't', 'long-ton', 'ton', 'short-ton']
            //       .map((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            //   onChanged: (String? newValue) {
            //     if (newValue != null) {
            //       setState(() {
            //         fromUnit = newValue;
            //       });
            //     }
            //   },
            // ),
            DropdownButton<String>(
              value: fromUnit,
              items: massUnitTranslations(context).keys.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(massUnitTranslations(context)[value]!),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    fromUnit = newValue;
                  });
                }
              },
            ),

            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: toUnit,
              items: massUnitTranslations(context).keys.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(massUnitTranslations(context)[value]!),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    toUnit = newValue;
                  });
                }
              },
            ),

            SizedBox(height: 32.0),
            DefaultButton(
              color:  context.watch<AppThemeCubit>().isDarkMode
                  ? AppDarkColors.primary
                  : MyColors.primary,

              fontSize: 20,
              fontWeight: FontWeight.bold,
              title: '${tr(context, "calculate")}',
              onTap: _performConversion,
            ),
            SizedBox(height: 16.0),
            MyText(title: result, color: MyColors.black, size: 20.sp,alien: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
