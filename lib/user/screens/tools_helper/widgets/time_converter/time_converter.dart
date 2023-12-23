import 'package:flutter/material.dart';

class TimeConverterScreen extends StatefulWidget {
  @override
  _TimeConverterScreenState createState() => _TimeConverterScreenState();
}

class _TimeConverterScreenState extends State<TimeConverterScreen> {
  double inputValue = 1.0;
  String fromUnit = 's';
  String toUnit = 'min';
  String result = '';

  void _performConversion() {
    try {
      double? convertedValue = convertTime(inputValue, fromUnit, toUnit);
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

  double? convertTime(double value, String fromUnit, String toUnit) {
    const Map<String, double> timeConversionFactors = {
      's': 1.0,
      'ds': 0.1,
      'cs': 0.01,
      'ms': 0.001,
      'µs': 1e-6,
      'ns': 1e-9,
      'das': 10.0,
      'hs': 100.0,
      'ks': 1000.0,
      'Ms': 1e6,
      'Gs': 1e9,
      'min': 60.0,
      'h': 3600.0,
      'd': 86400.0,
      'wk': 604800.0,
      'fn': 1209600.0,
      'mo': 2629800.0,
      'y': 31536000.0,
      'dec': 315360000.0,
      'c': 3153600000.0,
    };

    if (fromUnit == toUnit) {
      return value;
    }

    return value * timeConversionFactors[fromUnit]! / timeConversionFactors[toUnit]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Converter'),
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
              items: [
                's', 'ds', 'cs', 'ms', 'µs', 'ns', 'das', 'hs', 'ks', 'Ms', 'Gs', 'min', 'h', 'd', 'wk', 'fn', 'mo', 'y', 'dec', 'c'
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
                's', 'ds', 'cs', 'ms', 'µs', 'ns', 'das', 'hs', 'ks', 'Ms', 'Gs', 'min', 'h', 'd', 'wk', 'fn', 'mo', 'y', 'dec', 'c'
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
