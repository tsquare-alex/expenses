
import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/tools_helper/widgets/acceleration_converter/accekeration_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/area_converter/area_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/bmr/bmr.dart';
import 'package:expenses/user/screens/tools_helper/widgets/discount/discount_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/electric_converter/electric_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/length_converter/length_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/mass_converter/mass_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/percentage/percentage_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/qiblah/compass.dart';
import 'package:expenses/user/screens/tools_helper/widgets/scanner_qr_code/scanner_qr_code.dart';
import 'package:expenses/user/screens/tools_helper/widgets/services_tax/service_tax_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/speed_converter/speed_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/temperature_converter/temperature_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/time_converter/time_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../general/utilities/routers/RouterImports.gr.dart';
import '../bmi_calculator/bmi_calculator_imports.dart';
import '../change_currency/change_currency_imports.dart';
import '../database/cubit/database_cubit.dart';
import 'cubit/favorite_cubit.dart';
import 'widgets/build_tool_widget.dart';
import 'widgets/calculator/calculator_screen.dart';
import 'widgets/calender/calender_screen.dart';
import 'widgets/clothes_size/clothes_size_screen.dart';
import 'widgets/converter/converter_screen.dart';
import 'widgets/ring_size/ring_size_screen.dart';
import 'widgets/shoes_size/shoes_size_screen.dart';

class ToolsHelper extends StatelessWidget {
  const ToolsHelper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ExpandableTile(
              title: "commercial",
              Icons: FontAwesomeIcons.moneyBillWave,
              children: [
                BuildToolsWidget(
                  onTap: () => _navigateToToolScreen(context,"percentage"),
                  title: "percentage",
                  icon: Icons.percent,
                  isFavorite:
                  context.watch<FavoriteCubit>().isFavorite("percentage"),
                  onFavoriteTap: () =>
                      _toggleFavoriteStatus(context: context, toolName: "percentage",icon: Icons.percent),
                ),
                BuildToolsWidget(
                  onTap: () => _navigateToToolScreen(context,"tax"),
                  title: "tax",
                  icon: Icons.money_off,
                  isFavorite:
                  context.watch<FavoriteCubit>().isFavorite("tax"),
                  onFavoriteTap: () =>
                      _toggleFavoriteStatus(context:context, toolName:  "tax",icon: Icons.money_off),
                ),
                BuildToolsWidget(
                  onTap: () => _navigateToToolScreen(context,"discount"),
                  title: "discount",
                  icon: Icons.attach_money,
                  isFavorite:
                  context.watch<FavoriteCubit>().isFavorite("discount"),
                  onFavoriteTap: () =>
                      _toggleFavoriteStatus(context:context, toolName:  "discount",icon: Icons.attach_money),
                ),
              ]),
          ExpandableTile(
              title: "tools",
              Icons: FontAwesomeIcons.toolbox,
              children: [
                BuildToolsWidget(
                  onTap: () => _navigateToToolScreen(context,"scanner"),
                  title: "scanner",
                  icon: Icons.qr_code,
                  isFavorite:
                  context.watch<FavoriteCubit>().isFavorite("scanner"),
                  onFavoriteTap: () =>
                      _toggleFavoriteStatus(context:context,  toolName:"scanner",icon: Icons.qr_code),
                ),
                BuildToolsWidget(
                  onTap: () => _navigateToToolScreen(context, "qiblah"),
                  title: "qiblah",
                  icon: FontAwesomeIcons.kaaba,
                  isFavorite:
                  context.watch<FavoriteCubit>().isFavorite("qiblah"),
                  onFavoriteTap: () =>
                      _toggleFavoriteStatus(context:context,toolName:  "qiblah",icon: FontAwesomeIcons.kaaba),
                ),
                const SizedBox(height: 20),
                BuildToolsWidget(
                  onTap: () => _navigateToToolScreen(context, "calender"),
                  title: "calender",
                  icon: Icons.calendar_month,
                  isFavorite:
                  context.watch<FavoriteCubit>().isFavorite("calender"),
                  onFavoriteTap: () =>
                      _toggleFavoriteStatus(context:context,toolName: "calender",icon: Icons.calendar_month),
                ),
                const SizedBox(height: 20),
                BuildToolsWidget(
                  onTap: () => _navigateToToolScreen(context, "calculator"),
                  title: "calculator",
                  icon:  Icons.calculate_outlined,
                  isFavorite: context
                      .watch<FavoriteCubit>()
                      .isFavorite("calculator"),
                  onFavoriteTap: () =>
                      _toggleFavoriteStatus(context:context, toolName:"calculator",icon: Icons.calculate_outlined),
                ),
                const SizedBox(height: 20),
                BuildToolsWidget(
                  onTap: () => _navigateToToolScreen(context, "shoesSize"),
                  title: "shoesSize",
                  icon: FontAwesomeIcons.shoePrints,
                  isFavorite: context
                      .watch<FavoriteCubit>()
                      .isFavorite("shoesSize"),
                  onFavoriteTap: () =>
                      _toggleFavoriteStatus(context:context, toolName: "shoesSize",icon: FontAwesomeIcons.shoePrints),
                ),
                const SizedBox(height: 20),
                BuildToolsWidget(
                  onTap: () => _navigateToToolScreen(context, "ringSize"),
                  title: "ringSize",
                  icon: FontAwesomeIcons.ring,
                  isFavorite:
                  context.watch<FavoriteCubit>().isFavorite("ringSize"),
                  onFavoriteTap: () =>
                      _toggleFavoriteStatus(context:context, toolName: "ringSize",icon: FontAwesomeIcons.ring),
                ),
                const SizedBox(height: 20),
                BuildToolsWidget(
                  onTap: () =>
                      _navigateToToolScreen(context, "clothesSize"),
                  title: "clothesSize",
                  icon: FontAwesomeIcons.shirt,
                  isFavorite: context
                      .watch<FavoriteCubit>()
                      .isFavorite("clothesSize"),
                  onFavoriteTap: () =>
                      _toggleFavoriteStatus(context:context, toolName: "clothesSize",icon:  FontAwesomeIcons.shirt),
                ),
                const SizedBox(height: 20),
              ]),
          ExpandableTile(
            Icons: Icons.health_and_safety_outlined,
            title: "health",
            children: [
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "bmi"),
                title: "bmi",
                icon: FontAwesomeIcons.weightHanging,
                isFavorite:
                context.watch<FavoriteCubit>().isFavorite("bmi"),
                onFavoriteTap: () => _toggleFavoriteStatus(context:context, toolName:"bmi",icon: Icons.health_and_safety_outlined),
              ),
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "bmr"),
                title: "bmr",
                icon: Icons.health_and_safety,
                isFavorite:
                context.watch<FavoriteCubit>().isFavorite("bmr"),
                onFavoriteTap: () => _toggleFavoriteStatus(context:context, toolName: "bmr",icon: Icons.health_and_safety),
              ),
            ],
          ),
          ExpandableTile(
            title: "units",
            Icons: FontAwesomeIcons.unity,
            children: [
              BuildToolsWidget(
                onTap: () =>
                    _navigateToToolScreen(context, "convertCurrency"),
                title: "convertCurrency",
                icon: Icons.currency_exchange,
                isFavorite: context
                    .watch<FavoriteCubit>()
                    .isFavorite("convertCurrency"),
                onFavoriteTap: () =>
                    _toggleFavoriteStatus(context:context, toolName:  "convertCurrency",icon: Icons.currency_exchange),
              ),
              BuildToolsWidget(
                onTap: () =>
                    _navigateToToolScreen(context, "convertLength"),
                title: "convertLength",
                icon:Icons.height,
                isFavorite: context
                    .watch<FavoriteCubit>()
                    .isFavorite("convertLength"),
                onFavoriteTap: () =>
                    _toggleFavoriteStatus(context:context, toolName:   "convertLength",icon: Icons.height),
              ),
              BuildToolsWidget(
                onTap: () =>
                    _navigateToToolScreen(context, "convertMass"),
                title: "convertMass",
                icon: Icons.radar_outlined,
                isFavorite: context
                    .watch<FavoriteCubit>()
                    .isFavorite("convertMass"),
                onFavoriteTap: () =>
                    _toggleFavoriteStatus(context:context, toolName:  "convertMass",icon: Icons.radar_outlined),
              ),
              BuildToolsWidget(
                onTap: () =>
                    _navigateToToolScreen(context, "convertTime"),
                title: "convertTime",
                icon: Icons.timelapse,
                isFavorite: context
                    .watch<FavoriteCubit>()
                    .isFavorite("convertTime"),
                onFavoriteTap: () =>
                    _toggleFavoriteStatus(context:context, toolName:   "convertTime",icon: Icons.timelapse),
              ),
              BuildToolsWidget(
                onTap: () =>
                    _navigateToToolScreen(context, "convertElectric"),
                title: "convertElectric",
                icon: Icons.lightbulb,
                isFavorite: context
                    .watch<FavoriteCubit>()
                    .isFavorite("convertElectric"),
                onFavoriteTap: () =>
                    _toggleFavoriteStatus(context:context, toolName:    "convertElectric",icon: Icons.lightbulb),
              ),
              BuildToolsWidget(
                onTap: () =>
                    _navigateToToolScreen(context, "convertTemperature"),
                title: "convertTemperature",
                icon: Icons.light_mode_outlined,
                isFavorite: context
                    .watch<FavoriteCubit>()
                    .isFavorite("convertTemperature"),
                onFavoriteTap: () =>
                    _toggleFavoriteStatus(context:context, toolName:    "convertTemperature",icon: Icons.light_mode_outlined),
              ),
              BuildToolsWidget(
                onTap: () =>
                    _navigateToToolScreen(context, "convertAcceleration"),
                title: "convertAcceleration",
                icon: Icons.speed_outlined,
                isFavorite: context
                    .watch<FavoriteCubit>()
                    .isFavorite("convertAcceleration"),
                onFavoriteTap: () =>
                    _toggleFavoriteStatus(context:context, toolName:  "convertAcceleration",icon: Icons.speed_outlined),
              ),
              BuildToolsWidget(
                onTap: () =>
                    _navigateToToolScreen(context, "convertArea"),
                title: "convertArea",
                icon: Icons.area_chart_outlined,
                isFavorite: context
                    .watch<FavoriteCubit>()
                    .isFavorite("convertArea"),
                onFavoriteTap: () =>
                    _toggleFavoriteStatus(context:context, toolName:   "convertArea",icon: Icons.area_chart_outlined),
              ),
              BuildToolsWidget(
                onTap: () =>
                    _navigateToToolScreen(context, "convertSpeed"),
                title: "convertSpeed",
                icon:  Icons.shutter_speed,
                isFavorite: context
                    .watch<FavoriteCubit>()
                    .isFavorite("convertSpeed"),
                onFavoriteTap: () =>
                    _toggleFavoriteStatus(context:context, toolName:  "convertSpeed",icon: Icons.shutter_speed),
              ),
            ]),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToToolScreen(BuildContext context, String toolName) {
    switch (toolName) {
      case "percentage":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PercentageCalculatorScreen()));
        break;
      case "tax":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ServiceTaxCalculatorScreen()));
        break;
      case "discount":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DiscountCalculatorScreen()));
        break;
      case "qiblah":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => QiblahCompass()));
        break;
      case "scanner":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ScannerQrCode()));
        break;
      case "calender":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CalenderScreen()));
        break;
      case "calculator":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CalculatorScreen()));
        break;
      case "shoesSize":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ShoesSizeScreen()));
        break;
      case "ringSize":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const RingSizeScreen()));
        break;
      case "clothesSize":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ClothesSizeScreen()));
        break;
    // case "convert":
    //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConverterScreen()));
    //   break;
      case "bmi":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const BMICalculator()));
        break;
      case "bmr":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) =>  BmrCalculatorScreen()));
        break;
      case "convertCurrency":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ChangeCurrency()));
        break;
      case "convertLength":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => LengthConverterScreen()));
        break;
      case "convertMass":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MassConverterScreen()));
        break;
      case "convertTime":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TimeConverterScreen()));
        break;
      case "convertElectric":
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ElectricCurrentConverterScreen()));
        break;
      case "convertTemperature":
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TemperatureConverterScreen()));
        break;
      case "convertAcceleration":
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AccelerationConverterScreen()));
        break;
      case "convertArea":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AreaConverterScreen()));
        break;
      case "convertSpeed":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SpeedConverterScreen()));
        break;
    }
  }

  void _toggleFavoriteStatus(
      {required BuildContext context,required String toolName, required IconData icon}) {
    // var favoriteCubit = context.read<FavoriteCubit>();
    var favoriteCubit = context.read<FavoriteCubit>();
    if (favoriteCubit.isFavorite(toolName)) {
      favoriteCubit.toggleFavoriteStatus(toolName, icon.codePoint);
    } else {
      if (favoriteCubit.getFavoriteModels().length >= 4) {
        _showMaxFavoritesDialog(context);
      } else {
        favoriteCubit.toggleFavoriteStatus(toolName, icon.codePoint);
      }
    }
  }

  void _showMaxFavoritesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Max Favorites Reached"),
          content: const Text("You cannot choose more than 4 favorites."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }




}

class ExpandableTile extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final IconData Icons;

  ExpandableTile(
      {required this.title, required this.children, required this.Icons});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: ExpansionTile(
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.transparent)),
          title: Row(
            children: [
              Icon(
                Icons,
                color: Colors.blue, // Customize the color as needed
              ),
              const SizedBox(
                width: 15,
              ),
              MyText(
                title: tr(context, title),
                color: Colors.blue, // Customize the color as needed
                size: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          children: children,
        ),
      ),
    );
  }
}

