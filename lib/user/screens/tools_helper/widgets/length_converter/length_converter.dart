import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../general/constants/MyColors.dart';

class LengthConverterScreen extends StatefulWidget {
  @override
  _LengthConverterScreenState createState() => _LengthConverterScreenState();
}

class _LengthConverterScreenState extends State<LengthConverterScreen> {
  double inputValue = 1.0;
  String fromUnit = 'm';
  String toUnit = 'km';
  String result = '';

  void _performConversion() {
    try {
      double? convertedValue = convertLength(inputValue, fromUnit, toUnit);
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

  double? convertLength(double value, String fromUnit, String toUnit) {
    const Map<String, double> lengthConversionFactors = {
      'm': 1.0,
      'dm': 0.1,
      'cm': 0.01,
      'mm': 0.001,
      'µm': 1e-6,
      'nm': 1e-9,
      'dam': 10.0,
      'hm': 100.0,
      'km': 1000.0,
      'Mm': 1e6,
      'Gm': 1e9,
      'Å': 1e-10,
      'in': 0.0254,
      'ft': 0.3048,
      'yd': 0.9144,
      'mi': 1609.34,
      'nmi': 1852.0,
    };

    if (fromUnit == toUnit) {
      return value;
    }

    return value * lengthConversionFactors[fromUnit]! / lengthConversionFactors[toUnit]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:MyText(title: tr(context, "convertLength"), color: Colors.white, size: 18.sp,fontWeight: FontWeight.bold,),
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
              items: ['m', 'dm', 'cm', 'mm', 'µm', 'nm', 'dam', 'hm', 'km', 'Mm', 'Gm', 'Å', 'in', 'ft', 'yd', 'mi', 'nmi']
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
              items: ['m', 'dm', 'cm', 'mm', 'µm', 'nm', 'dam', 'hm', 'km', 'Mm', 'Gm', 'Å', 'in', 'ft', 'yd', 'mi', 'nmi']
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
