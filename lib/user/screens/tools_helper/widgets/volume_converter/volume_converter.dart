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

class VolumeConverterScreen extends StatefulWidget {
  @override
  _VolumeConverterScreenState createState() => _VolumeConverterScreenState();
}

class _VolumeConverterScreenState extends State<VolumeConverterScreen> {
  double inputValue = 1.0;
  String fromUnit = 'Milliliter';
  String toUnit = 'Liter';
  String result = '';

  void _performConversion() {
    try {
      double? convertedValue = convertVolume(inputValue, fromUnit, toUnit);
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

  double? convertVolume(double value, String fromUnit, String toUnit) {
    const Map<String, double> volumeConversionFactors = {
      'Milliliter': 1.0,
      'Centiliter': 10.0,
      'Deciliter': 100.0,
      'Liter': 1000.0,
      'CubicCentimeter': 1.0,
      'CubicMeter': 1e6,
      'MillionCubicMeters': 1e12,
      'Gallon': 3785.41,
      'Quart': 946.353,
      'Pint': 473.176,
      'Cup': 240.0,
      'FluidOunce': 29.5735,
    };

    if (fromUnit == toUnit) {
      return value;
    }

    return value * volumeConversionFactors[fromUnit]! / volumeConversionFactors[toUnit]!;
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
        title: MyText(
          title: tr(context, "convertVolume"),
          color:context.watch<AppThemeCubit>().isDarkMode
              ? MyColors.white
              :MyColors.black,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
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
                'Milliliter',
                'Centiliter',
                'Deciliter',
                'Liter',
                'CubicCentimeter',
                'CubicMeter',
                'MillionCubicMeters',
                'Gallon',
                'Quart',
                'Pint',
                'Cup',
                'FluidOunce',
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
                'Milliliter',
                'Centiliter',
                'Deciliter',
                'Liter',
                'CubicCentimeter',
                'CubicMeter',
                'MillionCubicMeters',
                'Gallon',
                'Quart',
                'Pint',
                'Cup',
                'FluidOunce',
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
            MyText(title: result, color:context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                :MyColors.black,size: 20.sp,alien: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
