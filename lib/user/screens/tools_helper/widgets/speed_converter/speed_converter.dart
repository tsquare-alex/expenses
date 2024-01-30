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

class SpeedConverterScreen extends StatefulWidget {
  @override
  _SpeedConverterScreenState createState() => _SpeedConverterScreenState();
}

class _SpeedConverterScreenState extends State<SpeedConverterScreen> {
  double inputValue = 0.0;
  String fromUnit = 'm/s';
  String toUnit = 'm/s';
  String result = '';

  void _performConversion() {
    try {
      double? convertedValue = convertSpeed(inputValue, fromUnit, toUnit);
      if (convertedValue != null) {
        setState(() {
          result = '${tr(context, "result")} $convertedValue $toUnit';
        });
      } else {
        setState(() {
          result = 'Invalid conversion';
        });
      }
    } catch (e) {
      setState(() {
        result = 'Invalid input';
      });
    }
  }

  double? convertSpeed(double value, String fromUnit, String toUnit) {
    const Map<String, double> speedConversionFactors = {
      'm/s': 1.0,
      'km/h': 0.277778,
      'ft/s': 0.3048,
      'mi/h': 0.44704,
      'kn': 0.514444,
    };

    return value * speedConversionFactors[fromUnit]! / speedConversionFactors[toUnit]!;
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
            ? AppDarkColors.backgroundColor
            :MyColors.white,
        title:MyText(title: tr(context, "convertSpeed"),
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
            DropdownButton<String>(
              value: fromUnit,
              items: [
                'm/s',
                'km/h',
                'ft/s',
                'mi/h',
                'kn',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
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
              items: [
                'm/s',
                'km/h',
                'ft/s',
                'mi/h',
                'kn',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
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
            MyText(title: result,
              color:context.watch<AppThemeCubit>().isDarkMode
                  ? MyColors.white
                  :MyColors.black,
              size: 20.sp,alien: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
