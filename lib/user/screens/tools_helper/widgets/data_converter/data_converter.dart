import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../general/constants/MyColors.dart';

class DataConverterScreen extends StatefulWidget {
  @override
  _DataConverterScreenState createState() => _DataConverterScreenState();
}

class _DataConverterScreenState extends State<DataConverterScreen> {
  double inputValue = 1.0;
  String fromUnit = 'Byte';
  String toUnit = 'Kilobyte';
  String result = '';

  void _performConversion() {
    try {
      double? convertedValue = convertDataSize(inputValue, fromUnit, toUnit);
      if (convertedValue != null) {
        setState(() {
          result = ' $convertedValue $toUnit';
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

  double? convertDataSize(double value, String fromUnit, String toUnit) {
    const Map<String, double> dataConversionFactors = {
      'Bit': 1.0,
      'Byte': 8.0,
      'Kilobit': 1e3,
      'Kilobyte': 8e3,
      'Megabit': 1e6,
      'Megabyte': 8e6,
      'Gigabit': 1e9,
      'Gigabyte': 8e9,
      'Terabit': 1e12,
      'Terabyte': 8e12,
    };

    if (fromUnit == toUnit) {
      return value;
    }

    return value * dataConversionFactors[fromUnit]! / dataConversionFactors[toUnit]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          title: tr(context, "convertData"),
          color: Colors.white,
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
                'Bit',
                'Byte',
                'Kilobit',
                'Kilobyte',
                'Megabit',
                'Megabyte',
                'Gigabit',
                'Gigabyte',
                'Terabit',
                'Terabyte',
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
                'Bit',
                'Byte',
                'Kilobit',
                'Kilobyte',
                'Megabit',
                'Megabyte',
                'Gigabit',
                'Gigabyte',
                'Terabit',
                'Terabyte',
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
            ElevatedButton(
              onPressed: _performConversion,
              child: MyText(title: tr(context, "calculate"), color: MyColors.primary, size: 25.sp,fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: 16.0),
           MyText(title:"${tr(context, "result")}: $result", color: MyColors.primary, size: 25.sp,fontWeight: FontWeight.bold,),

          ],
        ),
      ),
    );
  }
}
