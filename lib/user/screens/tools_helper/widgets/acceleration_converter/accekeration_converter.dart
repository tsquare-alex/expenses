import 'package:flutter/material.dart';

class AccelerationConverterScreen extends StatefulWidget {
  @override
  _AccelerationConverterScreenState createState() => _AccelerationConverterScreenState();
}

class _AccelerationConverterScreenState extends State<AccelerationConverterScreen> {
  double inputValue = 0.0;
  String fromUnit = 'm/s2';
  String toUnit = 'm/s2';
  String result = '';

  void _performConversion() {
    try {
      double? convertedValue = convertAcceleration(inputValue, fromUnit, toUnit);
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

  double? convertAcceleration(double value, String fromUnit, String toUnit) {
    const Map<String, double> accelerationConversionFactors = {
      'm/s2': 1.0,
      'cm/s2': 0.01,
      'ft/s2': 0.3048,
      'g': 9.80665,
    };

    return value * accelerationConversionFactors[fromUnit]! / accelerationConversionFactors[toUnit]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acceleration Converter'),
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
              items: ['m/s2', 'cm/s2', 'ft/s2', 'g'].map((String value) {
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
              items: ['m/s2', 'cm/s2', 'ft/s2', 'g'].map((String value) {
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
