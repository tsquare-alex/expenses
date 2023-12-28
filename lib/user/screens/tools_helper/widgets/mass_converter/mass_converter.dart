import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../general/constants/MyColors.dart';

class MassConverterScreen extends StatefulWidget {
  @override
  _MassConverterScreenState createState() => _MassConverterScreenState();
}

class _MassConverterScreenState extends State<MassConverterScreen> {
  double inputValue = 1.0;
  String fromUnit = 'kg';
  String toUnit = 'g';
  String result = '';

  void _performConversion() {
    try {
      double? convertedValue = convertMass(inputValue, fromUnit, toUnit);
      if (convertedValue != null) {
        setState(() {
          result = 'Result: $convertedValue $toUnit';
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
        title:MyText(title: tr(context, "convertMass"), color: Colors.white, size: 18.sp,fontWeight: FontWeight.bold,),
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
              decoration: InputDecoration(labelText: 'Enter Value'),
              onChanged: (value) {
                setState(() {
                  inputValue = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: fromUnit,
              items: ['kg', 'hg', 'dag', 'g', 'dg', 'cg', 'mg', 'µg', 'ng', 'Mg', 'Gg', 'oz', 'lb', 't', 'long-ton', 'ton', 'short-ton']
                  .map((String value) {
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
              items: ['kg', 'hg', 'dag', 'g', 'dg', 'cg', 'mg', 'µg', 'ng', 'Mg', 'Gg', 'oz', 'lb', 't', 'long-ton', 'ton', 'short-ton']
                  .map((String value) {
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
            ElevatedButton(
              onPressed: _performConversion,
              child: MyText(title: tr(context, "calculate"), color: MyColors.primary, size: 25.sp,fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: 16.0),
            Text(result),
          ],
        ),
      ),
    );
  }
}
