import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/screens/tools_helper/widgets/area_converter/area_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/bmr/bmr.dart';
import 'package:expenses/user/screens/tools_helper/widgets/data_converter/data_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/discount/discount_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/length_converter/length_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/mass_converter/mass_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/percentage/percentage_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/qiblah/compass.dart';
import 'package:expenses/user/screens/tools_helper/widgets/scanner_qr_code/scanner_qr_code.dart';
import 'package:expenses/user/screens/tools_helper/widgets/services_tax/service_tax_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/speed_converter/speed_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/temperature_converter/temperature_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/volume_converter/volume_converter.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Row(
          children: [
            Image.asset(
              Res.tools,
              width: 20.w,
              height: 20.h,
              color: MyColors.white,
            ),
            SizedBox(
              width: 10.w,
            ),
            MyText(
              title: tr(context, 'tools'),
              color: Colors.white,
              size: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ExpandableTile(
                gradient:  LinearGradient(colors: [
                  Colors.pink.withOpacity(0.2),
                  // Colors.blue,
                  Colors.orange.withOpacity(0.2)
                ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                  title: "commercial",
                  Icons: FontAwesomeIcons.moneyBillWave,
                  children: [
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "percentage"),
                      title: "percentage",
                      icon: Icons.percent,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("percentage"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "percentage",
                          icon: Icons.percent),
                    ),
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "tax"),
                      title: "tax",
                      icon: Icons.money_off,
                      isFavorite:
                          context.watch<FavoriteCubit>().isFavorite("tax"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "tax",
                          icon: Icons.money_off),
                    ),
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "discount"),
                      title: "discount",
                      icon: Icons.attach_money,
                      isFavorite:
                          context.watch<FavoriteCubit>().isFavorite("discount"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "discount",
                          icon: Icons.attach_money),
                    ),
                  ]),
              ExpandableTile(
                  gradient:  LinearGradient(colors: [
                    Colors.blue.withOpacity(0.2),
                    // Colors.blue,
                    Colors.orange.withOpacity(0.2)
                  ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  title: "tool",
                  Icons: FontAwesomeIcons.toolbox,
                  children: [
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "scanner"),
                      title: "scanner",
                      icon: Icons.qr_code,
                      isFavorite:
                          context.watch<FavoriteCubit>().isFavorite("scanner"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "scanner",
                          icon: Icons.qr_code),
                    ),
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "qiblah"),
                      title: "qiblah",
                      icon: FontAwesomeIcons.kaaba,
                      isFavorite:
                          context.watch<FavoriteCubit>().isFavorite("qiblah"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "qiblah",
                          icon: FontAwesomeIcons.kaaba),
                    ),
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "calender"),
                      title: "calender",
                      icon: Icons.calendar_month,
                      isFavorite:
                          context.watch<FavoriteCubit>().isFavorite("calender"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "calender",
                          icon: Icons.calendar_month),
                    ),
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "calculator"),
                      title: "calculator",
                      icon: Icons.calculate_outlined,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("calculator"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "calculator",
                          icon: Icons.calculate_outlined),
                    ),
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "shoesSize"),
                      title: "shoesSize",
                      icon: FontAwesomeIcons.shoePrints,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("shoesSize"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "shoesSize",
                          icon: FontAwesomeIcons.shoePrints),
                    ),
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "ringSize"),
                      title: "ringSize",
                      icon: FontAwesomeIcons.ring,
                      isFavorite:
                          context.watch<FavoriteCubit>().isFavorite("ringSize"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "ringSize",
                          icon: FontAwesomeIcons.ring),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "clothesSize"),
                      title: "clothesSize",
                      icon: FontAwesomeIcons.shirt,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("clothesSize"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "clothesSize",
                          icon: FontAwesomeIcons.shirt),
                    ),
                  ]),
              ExpandableTile(
                gradient:  LinearGradient(colors: [
                  Colors.pink.withOpacity(0.5),
                  Colors.cyan.withOpacity(0.2),
                ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                Icons: Icons.health_and_safety_outlined,
                title: "health",
                children: [
                  BuildToolsWidget(
                    onTap: () => _navigateToToolScreen(context, "bmi"),
                    title: "bmi",
                    icon: FontAwesomeIcons.weightHanging,
                    isFavorite:
                        context.watch<FavoriteCubit>().isFavorite("bmi"),
                    onFavoriteTap: () => _toggleFavoriteStatus(
                        context: context,
                        toolName: "bmi",
                        icon: Icons.health_and_safety_outlined),
                  ),
                  BuildToolsWidget(
                    onTap: () => _navigateToToolScreen(context, "bmr"),
                    title: "bmr",
                    icon: Icons.health_and_safety,
                    isFavorite:
                        context.watch<FavoriteCubit>().isFavorite("bmr"),
                    onFavoriteTap: () => _toggleFavoriteStatus(
                        context: context,
                        toolName: "bmr",
                        icon: Icons.health_and_safety),
                  ),
                ],
              ),
              ExpandableTile(
                  gradient:  LinearGradient(colors: [
                    Colors.indigo.withOpacity(0.5),
                    Colors.black.withOpacity(0.2),
                  ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  title: "currency",
                  Icons: FontAwesomeIcons.moneyCheck,
                  children: [
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertCurrency"),
                      title: "convertCurrency",
                      icon: Icons.currency_exchange,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertCurrency"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "convertCurrency",
                          icon: Icons.currency_exchange),
                    ),
                  ]),
              ExpandableTile(
                  gradient:  LinearGradient(colors: [
                    Colors.indigo.withOpacity(0.5),
                    Colors.purpleAccent.withOpacity(0.5),
                  ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  title: "units",
                  Icons: FontAwesomeIcons.unity,
                  children: [
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertLength"),
                      title: "convertLength",
                      icon: Icons.height,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertLength"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "convertLength",
                          icon: Icons.height),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertMass"),
                      title: "convertMass",
                      icon: Icons.radar_outlined,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertMass"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "convertMass",
                          icon: Icons.radar_outlined),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertTemperature"),
                      title: "convertTemperature",
                      icon: Icons.light_mode_outlined,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertTemperature"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "convertTemperature",
                          icon: Icons.light_mode_outlined),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertArea"),
                      title: "convertArea",
                      icon: Icons.area_chart_outlined,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertArea"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "convertArea",
                          icon: Icons.area_chart_outlined),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertSpeed"),
                      title: "convertSpeed",
                      icon: Icons.shutter_speed,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertSpeed"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "convertSpeed",
                          icon: Icons.shutter_speed),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertData"),
                      title: "convertData",
                      icon: Icons.data_exploration,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertData"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "convertData",
                          icon: Icons.data_exploration),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertVolume"),
                      title: "convertVolume",
                      icon: Icons.tapas_outlined,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertVolume"),
                      onFavoriteTap: () => _toggleFavoriteStatus(
                          context: context,
                          toolName: "convertVolume",
                          icon: Icons.data_exploration),
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
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PercentageCalculatorScreen()));
        break;
      case "tax":
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ServiceTaxCalculatorScreen()));
        break;
      case "discount":
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DiscountCalculatorScreen()));
        break;
      case "qiblah":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => QiblahCompass()));
        break;
      case "scanner":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ScannerQrCode()));
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
      case "bmi":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const BMICalculator()));
        break;
      case "bmr":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => BmrCalculatorScreen()));
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
      case "convertTemperature":
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TemperatureConverterScreen()));
        break;
      case "convertArea":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AreaConverterScreen()));
        break;
      case "convertSpeed":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SpeedConverterScreen()));
        break;
      case "convertData":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DataConverterScreen()));
        break;
        case "convertVolume":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => VolumeConverterScreen()));
        break;
    }
  }

  void _toggleFavoriteStatus(
      {required BuildContext context,
      required String toolName,
      required IconData icon}) {
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
          title: MyText(title: tr(context, "maxFavoriteReached"), color: Colors.red, size: 15,fontWeight: FontWeight.bold,),
          content: MyText(title: tr(context, "maxFavoriteNumber"), color: MyColors.primary, size: 15),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:MyText(title: tr(context, "ok"), color: MyColors.primary, size: 20),
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
  final Gradient gradient;

  ExpandableTile(
      {required this.title, required this.children, required this.Icons, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: ExpansionTile(
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.transparent)),
            title: Row(
              children: [
                Icon(
                  Icons,
                  color: Colors.white, // Customize the color as needed
                ),
                const SizedBox(
                  width: 15,
                ),
                MyText(
                  title: tr(context, title),
                  color: Colors.white, // Customize the color as needed
                  size: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            children: children,
          ),
        ),
      ),
    );
  }
}

// class ExpandableTile extends StatelessWidget {
//   final String title;
//   final List<Widget> children;
//   final IconData Icons;
//   final Gradient gradient;
//
//   ExpandableTile(
//       {required this.title, required this.children, required this.Icons, required this.gradient});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: gradient,
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 0.0),
//           child: ExpansionTile(
//             shape: const RoundedRectangleBorder(
//                 side: BorderSide(color: Colors.transparent)),
//             title: Row(
//               children: [
//                 Icon(
//                   Icons,
//                   color: Colors.blue, // Customize the color as needed
//                 ),
//                 const SizedBox(
//                   width: 15,
//                 ),
//                 MyText(
//                   title: tr(context, title),
//                   color: Colors.blue, // Customize the color as needed
//                   size: 20.sp,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ],
//             ),
//             children: children,
//           ),
//         ),
//       ),
//     );
//   }
// }
