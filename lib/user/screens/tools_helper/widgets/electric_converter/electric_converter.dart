import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElectricCurrentConverterScreen extends StatefulWidget {
  @override
  _ElectricCurrentConverterScreenState createState() => _ElectricCurrentConverterScreenState();
}

class _ElectricCurrentConverterScreenState extends State<ElectricCurrentConverterScreen> {
  double inputValue = 1.0;
  String fromUnit = 'A';
  String toUnit = 'mA';
  String result = '';

  void _performConversion() {
    try {
      double? convertedValue = convertElectricCurrent(inputValue, fromUnit, toUnit);
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

  double? convertElectricCurrent(double value, String fromUnit, String toUnit) {
    const Map<String, double> electricCurrentConversionFactors = {
      'A': 1.0,
      'mA': 0.001,
      'kA': 1000.0,
      'statA': 3.336e-10,
      'abA': 10.0,
    };

    if (fromUnit == toUnit) {
      return value;
    }

    return value * electricCurrentConversionFactors[fromUnit]! / electricCurrentConversionFactors[toUnit]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:MyText(title: tr(context, "convertElectric"), color: Colors.white, size: 18.sp,fontWeight: FontWeight.bold,),
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
              items: ['A', 'mA', 'kA', 'statA', 'abA'].map((String value) {
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
              items: ['A', 'mA', 'kA', 'statA', 'abA'].map((String value) {
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
              child: Text('Convert'),
            ),
            SizedBox(height: 16.0),
            Text(result),
          ],
        ),
      ),
    );
  }
}
