import 'package:flutter/material.dart';

class TemperatureConverterScreen extends StatefulWidget {
  @override
  _TemperatureConverterScreenState createState() => _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState extends State<TemperatureConverterScreen> {
  double inputValue = 0.0;
  String fromUnit = 'C';
  String toUnit = 'F';
  String result = '';

  void _performConversion() {
    try {
      double? convertedValue = convertTemperature(inputValue, fromUnit, toUnit);
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

  double? convertTemperature(double value, String fromUnit, String toUnit) {
    switch (fromUnit) {
      case 'K':
        switch (toUnit) {
          case 'K':
            return value;
          case 'C':
            return value - 273.15;
          case 'F':
            return (value - 273.15) * 9.0 / 5.0 + 32.0;
          case 'R':
            return value * 9.0 / 5.0;
        }
        break;
      case 'C':
        switch (toUnit) {
          case 'K':
            return value + 273.15;
          case 'C':
            return value;
          case 'F':
            return value * 9.0 / 5.0 + 32.0;
          case 'R':
            return (value + 273.15) * 9.0 / 5.0;
        }
        break;
      case 'F':
        switch (toUnit) {
          case 'K':
            return (value + 459.67) * 5.0 / 9.0;
          case 'C':
            return (value - 32.0) * 5.0 / 9.0;
          case 'F':
            return value;
          case 'R':
            return value + 459.67;
        }
        break;
      case 'R':
        switch (toUnit) {
          case 'K':
            return value * 5.0 / 9.0;
          case 'C':
            return (value - 491.67) * 5.0 / 9.0;
          case 'F':
            return value - 459.67;
          case 'R':
            return value;
        }
        break;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
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
              items: ['K', 'C', 'F', 'R'].map((String value) {
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
              items: ['K', 'C', 'F', 'R'].map((String value) {
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
