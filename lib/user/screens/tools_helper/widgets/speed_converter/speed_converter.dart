import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          result = '$convertedValue $toUnit';
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
        title:MyText(title: tr(context, "convertSpeed"), color: Colors.white, size: 18.sp,fontWeight: FontWeight.bold,),
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
