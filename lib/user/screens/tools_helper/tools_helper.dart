// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../general/utilities/routers/RouterImports.gr.dart';
// import 'cubit/favorite_cubit.dart';
// import 'widgets/build_tool_widget.dart';
// import 'widgets/calculator/calculator_screen.dart';
// import 'widgets/calender/calender_screen.dart';
// import 'widgets/clothes_size/clothes_size_screen.dart';
// import 'widgets/converter/converter_screen.dart';
// import 'widgets/length_conversion/length_converter.dart';
// import 'widgets/ring_size/ring_size_screen.dart';
// import 'widgets/shoes_size/shoes_size_screen.dart';
//
// class ToolsHelper extends StatelessWidget {
//   const ToolsHelper({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(14.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             _buildToolsWidget(context, "qiblah", FontAwesomeIcons.kaaba),
//             const SizedBox(height: 20),
//             _buildToolsWidget(context, "calender", FontAwesomeIcons.calendar),
//             const SizedBox(height: 20),
//             _buildToolsWidget(context, "calculator", FontAwesomeIcons.calculator),
//             const SizedBox(height: 20),
//             _buildToolsWidget(context, "shoesSize", FontAwesomeIcons.shoePrints),
//             const SizedBox(height: 20),
//             _buildToolsWidget(context, "ringSize", FontAwesomeIcons.ring),
//             const SizedBox(height: 20),
//             _buildToolsWidget(context, "clothesSize", FontAwesomeIcons.shirt),
//             const SizedBox(height: 20),
//             _buildToolsWidget(context, "convert", FontAwesomeIcons.exchange),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildToolsWidget(BuildContext context, String toolName, IconData icon) {
//     return BuildToolsWidget(
//       onTap: () {
//         // Change this to navigate to the appropriate screen based on toolName
//         _navigateToToolScreen(context, toolName);
//       },
//       title: toolName,
//       icon: icon,
//       isFavorite: context.watch<FavoriteCubit>().isFavorite(toolName),
//       onFavoriteTap: () {
//         _toggleFavoriteStatus(context, toolName);
//       },
//     );
//   }
//
//   void _navigateToToolScreen(BuildContext context, String toolName) {
//     switch (toolName) {
//       case "qiblah":
//         AutoRouter.of(context).push(QiblahCompassWidgetRoute());
//         break;
//       case "calender":
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalenderScreen()));
//         break;
//       case "calculator":
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalculatorScreen()));
//       case "shoesSize":
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShoesSizeScreen()));
//       case "ringSize":
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) => RingSizeScreen()));
//         break;
//       case "clothesSize":
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClothesSizeScreen()));
//         break;
//       case "convert":
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConverterScreen()));
//         break;
//     // Add cases for other tools if needed
//     }
//   }
//
//   void _toggleFavoriteStatus(BuildContext context, String toolName) {
//     var favoriteCubit = context.read<FavoriteCubit>();
//
//     if (favoriteCubit.isFavorite(toolName)) {
//       // If the tool is already a favorite, remove it without checking the limit
//       favoriteCubit.toggleFavoriteStatus(toolName);
//     } else {
//       // If the tool is not a favorite, check the limit before adding
//       if (favoriteCubit.getFavoriteModels().length >= 4) {
//         _showMaxFavoritesDialog(context);
//       } else {
//         favoriteCubit.toggleFavoriteStatus(toolName);
//       }
//     }
//   }
//
//   void _showMaxFavoritesDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Max Favorites Reached"),
//           content: Text("You cannot choose more than 4 favorites."),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/tools_helper/widgets/acceleration_converter/accekeration_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/area_converter/area_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/electric_converter/electric_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/length_converter/length_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/mass_converter/mass_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/qiblah/compass.dart';
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ExpandableTile(
                  title: "tools",
                  Icons: FontAwesomeIcons.toolbox,
                  children: [
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "qiblah"),
                      title: "qiblah",
                      icon: FontAwesomeIcons.kaaba,
                      isFavorite:
                          context.watch<FavoriteCubit>().isFavorite("qiblah"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(context, "qiblah"),
                    ),
                    const SizedBox(height: 20),
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "calender"),
                      title: "calender",
                      icon: FontAwesomeIcons.calendar,
                      isFavorite:
                          context.watch<FavoriteCubit>().isFavorite("calender"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(context, "calender"),
                    ),
                    const SizedBox(height: 20),
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "calculator"),
                      title: "calculator",
                      icon: FontAwesomeIcons.calculator,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("calculator"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(context, "calculator"),
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
                          _toggleFavoriteStatus(context, "shoesSize"),
                    ),
                    const SizedBox(height: 20),
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "ringSize"),
                      title: "ringSize",
                      icon: FontAwesomeIcons.ring,
                      isFavorite:
                          context.watch<FavoriteCubit>().isFavorite("ringSize"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(context, "ringSize"),
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
                          _toggleFavoriteStatus(context, "clothesSize"),
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
                    onFavoriteTap: () => _toggleFavoriteStatus(context, "bmi"),
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
                      icon: FontAwesomeIcons.moneyCheckDollar,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertCurrency"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(context, "convertCurrency"),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertLength"),
                      title: "convertLength",
                      icon: FontAwesomeIcons.leaf,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertLength"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(context, "convertLength"),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertMass"),
                      title: "convertMass",
                      icon: FontAwesomeIcons.leaf,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertMass"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(context, "convertMass"),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertTime"),
                      title: "convertTime",
                      icon: FontAwesomeIcons.times,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertTime"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(context, "convertTime"),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertElectric"),
                      title: "convertElectric",
                      icon: FontAwesomeIcons.lightbulb,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertElectric"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(context, "convertElectric"),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertTemperature"),
                      title: "convertTemperature",
                      icon: FontAwesomeIcons.temperature1,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertTemperature"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(context, "convertTemperature"),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertAcceleration"),
                      title: "convertAcceleration",
                      icon: FontAwesomeIcons.fastForward,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertAcceleration"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(context, "convertAcceleration"),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertArea"),
                      title: "convertArea",
                      icon: FontAwesomeIcons.chartArea,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertArea"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(context, "convertArea"),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertSpeed"),
                      title: "convertSpeed",
                      icon: FontAwesomeIcons.fastForward,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertSpeed"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(context, "convertSpeed"),
                    ),
                  ])
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToToolScreen(BuildContext context, String toolName) {
    switch (toolName) {
      case "qiblah":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => QiblahCompass()));
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
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ShoesSizeScreen()));
        break;
      case "ringSize":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const RingSizeScreen()));
        break;
      case "clothesSize":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ClothesSizeScreen()));
        break;
      // case "convert":
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConverterScreen()));
      //   break;
      case "bmi":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const BMICalculator()));
        break;
      case "convertCurrency":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ChangeCurrency()));
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

  void _toggleFavoriteStatus(BuildContext context, String toolName) {
    var favoriteCubit = context.read<FavoriteCubit>();

    if (favoriteCubit.isFavorite(toolName)) {
      favoriteCubit.toggleFavoriteStatus(toolName);
    } else {
      if (favoriteCubit.getFavoriteModels().length >= 4) {
        _showMaxFavoritesDialog(context);
      } else {
        favoriteCubit.toggleFavoriteStatus(toolName);
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
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ExpansionTile(
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.transparent
            )
          ),
          title: Row(
            children: [
              Icon(
                Icons,
                color: MyColors.primary,
              ),
              const SizedBox(
                width: 15,
              ),
             MyText(title: tr(context, title), color: MyColors.primary, size: 20.sp,fontWeight: FontWeight.bold,),
            ],
          ),
          children: children,
        ),
      ),
    );
  }
}
