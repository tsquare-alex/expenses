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
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "qiblah"),
                title: "qiblah",
                icon: FontAwesomeIcons.kaaba,
                isFavorite: context.watch<FavoriteCubit>().isFavorite("qiblah"),
                onFavoriteTap: () => _toggleFavoriteStatus(context, "qiblah"),
              ),
              const SizedBox(height: 20),
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "calender"),
                title: "calender",
                icon: FontAwesomeIcons.calendar,
                isFavorite: context.watch<FavoriteCubit>().isFavorite("calender"),
                onFavoriteTap: () => _toggleFavoriteStatus(context, "calender"),
              ),
              const SizedBox(height: 20),
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "calculator"),
                title: "calculator",
                icon: FontAwesomeIcons.calculator,
                isFavorite: context.watch<FavoriteCubit>().isFavorite("calculator"),
                onFavoriteTap: () => _toggleFavoriteStatus(context, "calculator"),
              ),
              const SizedBox(height: 20),
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "shoesSize"),
                title: "shoesSize",
                icon: FontAwesomeIcons.shoePrints,
                isFavorite: context.watch<FavoriteCubit>().isFavorite("shoesSize"),
                onFavoriteTap: () => _toggleFavoriteStatus(context, "shoesSize"),
              ),
              const SizedBox(height: 20),
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "ringSize"),
                title: "ringSize",
                icon: FontAwesomeIcons.ring,
                isFavorite: context.watch<FavoriteCubit>().isFavorite("ringSize"),
                onFavoriteTap: () => _toggleFavoriteStatus(context, "ringSize"),
              ),
              const SizedBox(height: 20),
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "clothesSize"),
                title: "clothesSize",
                icon: FontAwesomeIcons.shirt,
                isFavorite: context.watch<FavoriteCubit>().isFavorite("clothesSize"),
                onFavoriteTap: () => _toggleFavoriteStatus(context, "clothesSize"),
              ),
              const SizedBox(height: 20),
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "convert"),
                title: "convert",
                icon: FontAwesomeIcons.exchange,
                isFavorite: context.watch<FavoriteCubit>().isFavorite("convert"),
                onFavoriteTap: () => _toggleFavoriteStatus(context, "convert"),
              ),
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "bmi"),
                title: "bmi",
                icon: FontAwesomeIcons.weightHanging,
                isFavorite: context.watch<FavoriteCubit>().isFavorite("bmi"),
                onFavoriteTap: () => _toggleFavoriteStatus(context, "bmi"),
              ),
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "currency"),
                title: "currency",
                icon: FontAwesomeIcons.moneyCheckDollar,
                isFavorite: context.watch<FavoriteCubit>().isFavorite("currency"),
                onFavoriteTap: () => _toggleFavoriteStatus(context, "currency"),
              ),
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "length"),
                title: "length",
                icon: FontAwesomeIcons.leaf,
                isFavorite: context.watch<FavoriteCubit>().isFavorite("length"),
                onFavoriteTap: () => _toggleFavoriteStatus(context, "length"),
              ),
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "mass"),
                title: "mass",
                icon: FontAwesomeIcons.leaf,
                isFavorite: context.watch<FavoriteCubit>().isFavorite("mass"),
                onFavoriteTap: () => _toggleFavoriteStatus(context, "mass"),
              ),
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "time"),
                title: "time",
                icon: FontAwesomeIcons.times,
                isFavorite: context.watch<FavoriteCubit>().isFavorite("time"),
                onFavoriteTap: () => _toggleFavoriteStatus(context, "time"),
              ),
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "electric"),
                title: "electric",
                icon: FontAwesomeIcons.lightbulb,
                isFavorite: context.watch<FavoriteCubit>().isFavorite("electric"),
                onFavoriteTap: () => _toggleFavoriteStatus(context, "electric"),
              ),
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "temperature"),
                title: "temperature",
                icon: FontAwesomeIcons.temperature1,
                isFavorite: context.watch<FavoriteCubit>().isFavorite("temperature"),
                onFavoriteTap: () => _toggleFavoriteStatus(context, "temperature"),
              ),
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "acceleration"),
                title: "acceleration",
                icon: FontAwesomeIcons.fastForward,
                isFavorite: context.watch<FavoriteCubit>().isFavorite("acceleration"),
                onFavoriteTap: () => _toggleFavoriteStatus(context, "acceleration"),
              ),
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "area"),
                title: "area",
                icon: FontAwesomeIcons.chartArea,
                isFavorite: context.watch<FavoriteCubit>().isFavorite("area"),
                onFavoriteTap: () => _toggleFavoriteStatus(context, "area"),
              ),
              BuildToolsWidget(
                onTap: () => _navigateToToolScreen(context, "speed"),
                title: "speed",
                icon: FontAwesomeIcons.fastForward,
                isFavorite: context.watch<FavoriteCubit>().isFavorite("speed"),
                onFavoriteTap: () => _toggleFavoriteStatus(context, "speed"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToToolScreen(BuildContext context, String toolName) {
    switch (toolName) {
      case "qiblah":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => QiblahCompass()));
        break;
      case "calender":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalenderScreen()));
        break;
      case "calculator":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalculatorScreen()));
        break;
      case "shoesSize":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShoesSizeScreen()));
        break;
      case "ringSize":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => RingSizeScreen()));
        break;
      case "clothesSize":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClothesSizeScreen()));
        break;
      case "convert":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConverterScreen()));
        break; case "bmi":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => BMICalculator()));
        break;
        case "currency":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeCurrency()));
        break;
        case "length":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LengthConverterScreen()));
        break;
        case "mass":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MassConverterScreen()));
        break;
        case "time":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TimeConverterScreen()));
        break;
      case "electric":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ElectricCurrentConverterScreen()));
        break;
        case "temperature":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TemperatureConverterScreen()));
        break;
      case "acceleration":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccelerationConverterScreen()));
        break;
      case "area":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AreaConverterScreen()));
        break;
      case "speed":
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SpeedConverterScreen()));
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
          title: Text("Max Favorites Reached"),
          content: Text("You cannot choose more than 4 favorites."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

// // class ToolsHelper extends StatelessWidget {
// //   const ToolsHelper({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(14.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             BuildToolsWidget(
// //               onTap: () => AutoRouter.of(context).push(QiblahCompassWidgetRoute()),
// //               title: "qiblah",
// //               icon: FontAwesomeIcons.kaaba,
// //               isFavorite: context.watch<FavoriteCubit>().isFavorite("qiblah"),
// //               onFavoriteTap: () => context.read<FavoriteCubit>().toggleFavoriteStatus("qiblah"),
// //             ),
// //             const SizedBox(height: 20),
// //             BuildToolsWidget(
// //               onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalenderScreen())),
// //               title: "calender",
// //               icon: FontAwesomeIcons.calendar,
// //               isFavorite: context.watch<FavoriteCubit>().isFavorite("calender"),
// //               onFavoriteTap: () => context.read<FavoriteCubit>().toggleFavoriteStatus("calender"),
// //             ),
// //             const SizedBox(height: 20),
// //             BuildToolsWidget(
// //               onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalculatorScreen())),
// //               title: "calculator",
// //               icon: FontAwesomeIcons.calculator,
// //               isFavorite: context.watch<FavoriteCubit>().isFavorite("calculator"),
// //               onFavoriteTap: () => context.read<FavoriteCubit>().toggleFavoriteStatus("calculator"),
// //             ),
// //             const SizedBox(height: 20),
// //             BuildToolsWidget(
// //               onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShoesSizeScreen())),
// //               title: "shoesSize",
// //               icon: FontAwesomeIcons.shoePrints,
// //               isFavorite: context.watch<FavoriteCubit>().isFavorite("shoesSize"),
// //               onFavoriteTap: () => context.read<FavoriteCubit>().toggleFavoriteStatus("shoesSize"),
// //             ),
// //             const SizedBox(height: 20),
// //             BuildToolsWidget(
// //               onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => RingSizeScreen())),
// //               title: "ringSize",
// //               icon: FontAwesomeIcons.ring,
// //               isFavorite: context.watch<FavoriteCubit>().isFavorite("ringSize"),
// //               onFavoriteTap: () => context.read<FavoriteCubit>().toggleFavoriteStatus("ringSize"),
// //             ),
// //             const SizedBox(height: 20),
// //             BuildToolsWidget(
// //               onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClothesSizeScreen())),
// //               title: "clothesSize",
// //               icon: FontAwesomeIcons.shirt,
// //               isFavorite: context.watch<FavoriteCubit>().isFavorite("clothesSize"),
// //               onFavoriteTap: () => context.read<FavoriteCubit>().toggleFavoriteStatus("clothesSize"),
// //             ),
// //             const SizedBox(height: 20),
// //             BuildToolsWidget(
// //               title: "convert",
// //               icon: FontAwesomeIcons.exchange,
// //               isFavorite: context.watch<FavoriteCubit>().isFavorite("convert"),
// //               onFavoriteTap: () => context.read<FavoriteCubit>().toggleFavoriteStatus("convert"),
// //               onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConverterScreen())),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
