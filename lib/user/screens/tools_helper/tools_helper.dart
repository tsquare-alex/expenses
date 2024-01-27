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
import 'package:expenses/user/screens/tools_helper/widgets/note/note_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/percentage/percentage_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/qiblah/compass.dart';
import 'package:expenses/user/screens/tools_helper/widgets/reminder/reminder.dart';
import 'package:expenses/user/screens/tools_helper/widgets/ruler/ruler_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/scanner_qr_code/scanner_qr_code.dart';
import 'package:expenses/user/screens/tools_helper/widgets/services_tax/service_tax_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/speed_converter/speed_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/stop_watch/stop_watch_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/temperature_converter/temperature_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/temporary/temporary_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/unit_price/unit_price.dart';
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
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Res.tool_ic,
              // width: 20.w,
              // height: 20.h,
              // color: MyColors.white,
            ),
            SizedBox(
              width: 10.w,
            ),
            MyText(
              title: tr(context, 'tools'),
              color: MyColors.black100,
              size: 20.sp,
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
                  image: Res.tool_1,
                  title: "tool",
                  children: [
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "calculator"),
                      title: "calculator",
                      image:Res.tool_ic,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("calculator"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "calculator",
                              imagePath: Res.tool_ic),
                    ),
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "scanner"),
                      title: "scanner",
                      image: Res.barcode_ic,
                      isFavorite:
                      context.watch<FavoriteCubit>().isFavorite("scanner"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "scanner",
                              imagePath: Res.barcode_ic),
                    ),
                    BuildToolsWidget(
                      onTap: () {},
                      title: "zoomIn",
                      image: Res.zoom_ic,
                      isFavorite:false,
                      onFavoriteTap: () {},
                    ),
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "note"),
                      title: "note",
                      image: Res.note_ic,
                      isFavorite:  context.watch<FavoriteCubit>().isFavorite("note"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "note",
                              imagePath: Res.note_ic),
                    ),
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "ruler"),
                      title: "ruler",
                      image: Res.ruler_ic,
                      isFavorite:
                      context.watch<FavoriteCubit>().isFavorite("ruler"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "ruler",
                              imagePath:Res.ruler_ic),
                    ),
                    BuildToolsWidget(
                      onTap: () {},
                      title: "waterScale",
                      image: Res.waterScale_ic,
                      isFavorite:false,
                      onFavoriteTap: () {},
                    ),
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "qiblah"),
                      title: "qiblah",
                      image: Res.qiblah_ic,
                      isFavorite:
                      context.watch<FavoriteCubit>().isFavorite("qiblah"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "qiblah",
                              imagePath: Res.qiblah_ic),
                    ),





                    // BuildToolsWidget(
                    //   onTap: () => _navigateToToolScreen(context, "shoesSize"),
                    //   title: "shoesSize",
                    //   imagePath: FontAwesomeIcons.shoePrints,
                    //   isFavorite: context
                    //       .watch<FavoriteCubit>()
                    //       .isFavorite("shoesSize"),
                    //   onFavoriteTap: () =>
                    //       _toggleFavoriteStatus(
                    //           context: context,
                    //           toolName: "shoesSize",
                    //           imagePath: FontAwesomeIcons.shoePrints),
                    // ),

                  ]),
              ExpandableTile(
                  image: Res.time_ic,
                  title: "timeManagement",
                  children: [
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "reminder"),
                      title: "reminder",
                      image: Res.reminder_ic,
                      isFavorite:
                      context.watch<FavoriteCubit>().isFavorite("reminder"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "reminder",
                              imagePath: Res.reminder_ic),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "temporary"),
                      title: "temporary",
                      image: Res.temporary_ic,
                      isFavorite:
                      context.watch<FavoriteCubit>().isFavorite("temporary"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "temporary",
                              imagePath: Res.temporary_ic),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "stopWatch"),
                      title: "stopWatch",
                      image: Res.stopwatch_ic,
                      isFavorite : context.watch<FavoriteCubit>().isFavorite("stopWatch"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "stopWatch",
                              imagePath: Res.temporary_ic),
                    ),
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "calender"),
                      title: "calender",
                      image: Res.calendar_ic,
                      isFavorite:
                      context.watch<FavoriteCubit>().isFavorite("calender"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "calender",
                              imagePath: Res.calendar_ic),
                    ),
                  ]),
              ExpandableTile(

                  title: "commercial",
                  image: Res.money_ic,
                  children: [
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "percentage"),
                      title: "percentage",
                      image: Res.percentage_ic,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("percentage"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "percentage",
                              imagePath: Res.percentage_ic),
                    ),
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "tax"),
                      title: "tax",
                      image: Res.tax_ic,
                      isFavorite:
                      context.watch<FavoriteCubit>().isFavorite("tax"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "tax",
                              imagePath: Res.tax_ic),
                    ),
                    BuildToolsWidget(
                      onTap: () => _navigateToToolScreen(context, "discount"),
                      title: "discount",
                      image:Res.discount_ic,
                      isFavorite:
                      context.watch<FavoriteCubit>().isFavorite("discount"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "discount",
                              imagePath: Res.discount_ic),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "calculateUnitPrice"),
                      title: "calculateUnitPrice",
                      image: Res.unitprice_ic,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("calculateUnitPrice"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "calculateUnitPrice",
                              imagePath:  Res.unitprice_ic),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertCurrency"),
                      title: "convertCurrency",
                      image: Res.transfer_ic,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertCurrency"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "convertCurrency",
                              imagePath:  Res.transfer_ic),
                    ),
                  ]),

              ExpandableTile(
                image: Res.lifetool_ic,
                title: "health",
                children: [
                  BuildToolsWidget(
                    onTap: () => _navigateToToolScreen(context, "bmi"),
                    title: "bmi",
                    image: Res.bmi_ic,
                    isFavorite:
                    context.watch<FavoriteCubit>().isFavorite("bmi"),
                    onFavoriteTap: () =>
                        _toggleFavoriteStatus(
                            context: context,
                            toolName: "bmi",
                            imagePath: Res.bmi_ic),
                  ),
                  BuildToolsWidget(
                    onTap: () => _navigateToToolScreen(context, "bmr"),
                    title: "bmr",
                    image: Res.bmr_ic,
                    isFavorite:
                    context.watch<FavoriteCubit>().isFavorite("bmr"),
                    onFavoriteTap: () =>
                        _toggleFavoriteStatus(
                            context: context,
                            toolName: "bmr",
                            imagePath: Res.bmr_ic),
                  ),
                  BuildToolsWidget(
                    onTap: () => _navigateToToolScreen(context, "ringSize"),
                    title: "ringSize",
                    image: Res.ring_ic,
                    isFavorite:
                    context.watch<FavoriteCubit>().isFavorite("ringSize"),
                    onFavoriteTap: () =>
                        _toggleFavoriteStatus(
                            context: context,
                            toolName: "ringSize",
                            imagePath: Res.ring_ic),
                  ),
                  BuildToolsWidget(
                    onTap: () =>
                        _navigateToToolScreen(context, "clothesSize"),
                    title: "clothesSize",
                    image: Res.clothessize_ic,
                    isFavorite: context
                        .watch<FavoriteCubit>()
                        .isFavorite("clothesSize"),
                    onFavoriteTap: () =>
                        _toggleFavoriteStatus(
                            context: context,
                            toolName: "clothesSize",
                            imagePath:Res.clothessize_ic),
                  ),
                ],
              ),
              ExpandableTile(
                  title: "units",
                  image: Res.unit_ic,
                  children: [
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertLength"),
                      title: "convertLength",
                      image: Res.length_ic,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertLength"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "convertLength",
                              imagePath: Res.unit_ic),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertMass"),
                      title: "convertMass",
                      image: Res.size_ic,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertMass"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "convertMass",
                              imagePath: Res.size_ic),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertTemperature"),
                      title: "convertTemperature",
                      image: Res.temperature_ic,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertTemperature"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "convertTemperature",
                              imagePath: Res.temperature_ic),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertArea"),
                      title: "convertArea",
                      image: Res.area_ic,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertArea"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "convertArea",
                              imagePath: Res.area_ic),
                    ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertSpeed"),
                      title: "convertSpeed",
                      image: Res.speed_ic,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertSpeed"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "convertSpeed",
                              imagePath: Res.speed_ic),
                    ),
                    // BuildToolsWidget(
                    //   onTap: () =>
                    //       _navigateToToolScreen(context, "convertData"),
                    //   title: "convertData",
                    //   image: Res.areaIc,
                    //   isFavorite: context
                    //       .watch<FavoriteCubit>()
                    //       .isFavorite("convertData"),
                    //   onFavoriteTap: () =>
                    //       _toggleFavoriteStatus(
                    //           context: context,
                    //           toolName: "convertData",
                    //           imagePath: Icons.data_exploration),
                    // ),
                    BuildToolsWidget(
                      onTap: () =>
                          _navigateToToolScreen(context, "convertVolume"),
                      title: "convertVolume",
                      image: Res.weight_ic,
                      isFavorite: context
                          .watch<FavoriteCubit>()
                          .isFavorite("convertVolume"),
                      onFavoriteTap: () =>
                          _toggleFavoriteStatus(
                              context: context,
                              toolName: "convertVolume",
                              imagePath: Res.weight_ic),
                    ),
                  ]),

            ],
          ),
        ),
      ),
    );
  }

  void _navigateToToolScreen(BuildContext context, String toolName) {
    switch (toolName)
    {
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
            .push(
            MaterialPageRoute(builder: (context) => const ScannerQrCode()));
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
      case "reminder":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ReminderScreen()));
        break;
      case "ruler":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => RulerScreen()));
        break;
      case "note":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NoteView()));
        break;
        case "calculateUnitPrice":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => UnitPriceScreen()));
        break;
      case "temporary":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TemporaryScreen()));
        break;
        case "stopWatch":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => StopwatchScreen()));
        break;
    }
  }
  void _toggleFavoriteStatus({
    required BuildContext context,
    required String toolName,
    required String imagePath,
  }) {
    var favoriteCubit = context.read<FavoriteCubit>();

    if (favoriteCubit.isFavorite(toolName)) {
      favoriteCubit.toggleFavoriteStatus(toolName, imagePath);
    } else {
      if (favoriteCubit.getFavoriteModels().length >= 4) {
        _showMaxFavoritesDialog(context);
      } else {
        favoriteCubit.toggleFavoriteStatus(toolName, imagePath);
      }
    }
  }

  // void _toggleFavoriteStatus({required BuildContext context,
  //   required String toolName,
  //   required String imagePath}) {
  //   // var favoriteCubit = context.read<FavoriteCubit>();
  //   var favoriteCubit = context.read<FavoriteCubit>();
  //   if (favoriteCubit.isFavorite(toolName)) {
  //     favoriteCubit.toggleFavoriteStatus(toolName, icon.codePoint);
  //   } else {
  //     if (favoriteCubit
  //         .getFavoriteModels()
  //         .length >= 4) {
  //       _showMaxFavoritesDialog(context);
  //     } else {
  //       favoriteCubit.toggleFavoriteStatus(toolName, icon.codePoint);
  //     }
  //   }
  // }

  void _showMaxFavoritesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: MyText(title: tr(context, "maxFavoriteReached"),
            color: Colors.red,
            size: 15,
            fontWeight: FontWeight.bold,),
          content: MyText(title: tr(context, "maxFavoriteNumber"),
              color: MyColors.primary,
              size: 15),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: MyText(
                  title: tr(context, "ok"), color: MyColors.primary, size: 20),
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
  final String image;

  ExpandableTile(
      {required this.title, required this.children, required this.image,});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: MyColors.greyWhite,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: ExpansionTile(
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.transparent)),
            title: Row(
              children: [
                Image.asset(image),
                const SizedBox(
                  width: 15,
                ),
                MyText(
                  title: tr(context, title),
                  color: MyColors.black,
                  size: 16,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            children: _buildChildrenWithDividers(context),

          ),
        ),
      ),
    );
  }
  List<Widget> _buildChildrenWithDividers(BuildContext context) {
    List<Widget> widgetList = [];
    for (int i = 0; i < children.length; i++) {
      widgetList.add(children[i]);
      if (i < children.length - 1) {

        widgetList.add(Divider(
          height: 1,
          color: MyColors.greyWhite,
        ));
      }
    }
    return widgetList;
  }
}


