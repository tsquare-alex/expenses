import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../general/themes/app_colors.dart';
import '../../../../../general/themes/cubit/app_theme_cubit.dart';

class ConverterScreen extends StatefulWidget {
  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final UnitConverter converter = UnitConverter();
  double inputValue = 1.0;
  String fromUnit = 'm';
  String toUnit = 'km';
  String quantity = 'Length';
  String result = '';

  void _performConversion() {
    try {
      double? convertedValue = converter.convert(inputValue, fromUnit, toUnit, quantity);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode ? AppDarkColors.backgroundColor:MyColors.white,
        centerTitle: true,
        title:MyText(title: tr(context, "convert"), color: Colors.white, size: 15.sp,fontWeight: FontWeight.bold,),
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
              value: quantity,
              items: UnitConverter.quantities.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    quantity = newValue;
                    fromUnit = UnitConverter.units[quantity]![0]; // Default to the first unit in the list
                    toUnit = UnitConverter.units[quantity]![1]; // Default to the second unit in the list
                  });
                }
              },
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: fromUnit,
              items: UnitConverter.units[quantity]!.map((String value) {
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
              items: UnitConverter.units[quantity]!.map((String value) {
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

class UnitConverter {
  static const List<String> quantities = [
    'Length',
    'Mass',
    'Time',
    'ElectricCurrent',
    'Temperature',
    'Acceleration',
    'Area',
    'Speed',
  ];


  static final Map<String, List<String>> units = {
    'Length': ['m', 'dm', 'cm', 'mm', 'µm', 'nm', 'dam', 'hm', 'km', 'Mm', 'Gm', 'Å', 'in', 'ft', 'yd', 'mi', 'nmi'],
    'Mass': ['kg', 'hg', 'dag', 'g', 'dg', 'cg', 'mg', 'µg', 'ng', 'Mg', 'Gg', 'oz', 'lb', 't', 'long-ton', 'ton', 'short-ton'],
    'Time': ['s', 'ds', 'cs', 'ms', 'µs', 'ns', 'das', 'hs', 'ks', 'Ms', 'Gs', 'min', 'h', 'd', 'wk', 'fn', 'mo', 'y', 'dec', 'c'],
    'ElectricCurrent': ['A', 'mA', 'kA', 'statA', 'abA'],
    'Temperature': ['K', 'C', 'F', 'R'],
    'Acceleration': ['m/s2', 'cm/s2', 'ft/s2', 'g'],
    'Speed': ['m/s', 'km/h', 'ft/s', 'mi/h', 'kn'],
    'Area': ['m2', 'dm2', 'cm2', 'mm2', 'µm2', 'dam2', 'hm2', 'km2', 'Mm2', 'in2', 'ft2', 'mi2', 'ac'],

  };

  double? convert(double value, String fromUnit, String toUnit, String quantity) {
    if (fromUnit == toUnit) {
      return value;
    }

    switch (quantity) {
      case 'Length':
        return _convertLength(value, fromUnit, toUnit);
      case 'Mass':
        return _convertMass(value, fromUnit, toUnit);
      case 'Time':
        return _convertTime(value, fromUnit, toUnit);
      case 'ElectricCurrent':
        return _convertElectricCurrent(value, fromUnit, toUnit);
      case 'Temperature':
        return _convertTemperature(value, fromUnit, toUnit);
      case 'Acceleration':
        return _convertAcceleration(value, fromUnit, toUnit);
      case 'Speed':
        return _convertSpeed(value, fromUnit, toUnit);
      case 'Area':
        return _convertArea(value, fromUnit, toUnit);
      default:
        return null;
    }
  }


  double? _convertLength(double value, String fromUnit, String toUnit) {
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

    return value * lengthConversionFactors[fromUnit]! / lengthConversionFactors[toUnit]!;
  }

  double? _convertMass(double value, String fromUnit, String toUnit) {
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

    return value * massConversionFactors[fromUnit]! / massConversionFactors[toUnit]!;
  }

  double? _convertTime(double value, String fromUnit, String toUnit) {
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

    return value * timeConversionFactors[fromUnit]! / timeConversionFactors[toUnit]!;
  }

  double? _convertElectricCurrent(double value, String fromUnit, String toUnit) {
    const Map<String, double> electricCurrentConversionFactors = {
      'A': 1.0,
      'mA': 0.001,
      'kA': 1000.0,
      'statA': 3.336e-10,
      'abA': 10.0,
    };

    return value * electricCurrentConversionFactors[fromUnit]! / electricCurrentConversionFactors[toUnit]!;
  }

  double? _convertTemperature(double value, String fromUnit, String toUnit) {
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

  double? _convertAcceleration(double value, String fromUnit, String toUnit) {
    const Map<String, double> accelerationConversionFactors = {
      'm/s2': 1.0,
      'cm/s2': 0.01,
      'ft/s2': 0.3048,
      'g': 9.80665,
    };

    return value * accelerationConversionFactors[fromUnit]! / accelerationConversionFactors[toUnit]!;
  }

  double? _convertSpeed(double value, String fromUnit, String toUnit) {
    const Map<String, double> speedConversionFactors = {
      'm/s': 1.0,
      'km/h': 0.277778,
      'ft/s': 0.3048,
      'mi/h': 0.44704,
      'kn': 0.514444,
    };

    return value * speedConversionFactors[fromUnit]! / speedConversionFactors[toUnit]!;
  }

  double? _convertArea(double value, String fromUnit, String toUnit) {
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


}
