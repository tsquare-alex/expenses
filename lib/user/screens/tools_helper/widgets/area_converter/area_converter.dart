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

class AreaConverterScreen extends StatefulWidget {
  @override
  _AreaConverterScreenState createState() => _AreaConverterScreenState();
}

class _AreaConverterScreenState extends State<AreaConverterScreen> {
  double inputValue = 0.0;
  String fromUnit = 'm2';
  String toUnit = 'm2';
  String result = '';

  void _performConversion() {
    try {
      double? convertedValue = convertArea(inputValue, fromUnit, toUnit);
      if (convertedValue != null) {
        setState(() {
          result = '${tr(context, "result")}: $convertedValue ${areaUnitTranslations(context)[toUnit]}';
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

  Map<String, String> areaUnitTranslations(BuildContext context) {
    return {
      'm2': tr(context, 'square_meter'),
      'dm2': tr(context, 'square_decimeter'),
      'cm2': tr(context, 'square_centimeter'),
      'mm2': tr(context, 'square_millimeter'),
      'µm2': tr(context, 'square_micrometer'),
      'dam2': tr(context, 'square_decameter'),
      'hm2': tr(context, 'square_hectometer'),
      'km2': tr(context, 'square_kilometer'),
      'Mm2': tr(context, 'square_megameter'),
      'in2': tr(context, 'square_inch'),
      'ft2': tr(context, 'square_foot'),
      'mi2': tr(context, 'square_mile'),
      'ac': tr(context, 'acre'),
    };
  }

  double? convertArea(double value, String fromUnit, String toUnit) {
    const Map<String, double> areaConversionFactors = {
      'm2': 1.0,
      'dm2': 0.0001,
      'cm2': 0.000001,
      'mm2': 1e-6,
      'µm2': 1e-12,
      'dam2': 100.0,
      'hm2': 10000.0,
      'km2': 1e6,
      'Mm2': 1e12,
      'in2': 0.00064516,
      'ft2': 0.092903,
      'mi2': 2589988e6,
      'ac': 4046.86,
    };

    return value * areaConversionFactors[fromUnit]! / areaConversionFactors[toUnit]!;
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
            : MyColors.white,
        title: MyText(
          title: tr(context, "convertArea"),
          color: context.watch<AppThemeCubit>().isDarkMode
              ? MyColors.white
              : MyColors.black,
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
              items: areaUnitTranslations(context).keys.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(areaUnitTranslations(context)[value]!),
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
              items: areaUnitTranslations(context).keys.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(areaUnitTranslations(context)[value]!),
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
              color: context.watch<AppThemeCubit>().isDarkMode
                  ? AppDarkColors.primary
                  : MyColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              title: '${tr(context, "calculate")}',
              onTap: _performConversion,
            ),
            SizedBox(height: 16.0),
            MyText(
              title: result,
              color: MyColors.black,
              size: 20.sp,
              alien: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
