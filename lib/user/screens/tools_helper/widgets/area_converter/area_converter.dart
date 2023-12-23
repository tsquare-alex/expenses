import 'package:flutter/material.dart';

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
        title: Text('Area Converter'),
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
                'm2',
                'dm2',
                'cm2',
                'mm2',
                'µm2',
                'dam2',
                'hm2',
                'km2',
                'Mm2',
                'in2',
                'ft2',
                'mi2',
                'ac',
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
                'm2',
                'dm2',
                'cm2',
                'mm2',
                'µm2',
                'dam2',
                'hm2',
                'km2',
                'Mm2',
                'in2',
                'ft2',
                'mi2',
                'ac',
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