import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/tools_helper/widgets/arena_converter/arena_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/build_tool_widget.dart';
import 'package:expenses/user/screens/tools_helper/widgets/calculator/calculator_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/calender/calender_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/clothes_size/clothes_size_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/length_conversion/length_conversion.dart';
import 'package:expenses/user/screens/tools_helper/widgets/ring_size/ring_size_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/shoes_size/shoes_size_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToolsHelper extends StatelessWidget {
   ToolsHelper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: MyText(title: tr(context, "toolsHelper"), color: Colors.white, size: 15.sp,fontWeight: FontWeight.bold,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BuildToolsWidget(
              onTap: ()=> AutoRouter.of(context).push(QiblahCompassWidgetRoute()),
              title: "qiblah",icon: FontAwesomeIcons.kaaba,),
            const SizedBox(height: 20),
            BuildToolsWidget(
              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CalenderScreen())),
              title: "calender",icon: FontAwesomeIcons.calendar,),
            const SizedBox(height: 20),
            BuildToolsWidget(
              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CalculatorScreen())),
              title: "calculator",icon: FontAwesomeIcons.calculator,),
            const SizedBox(height: 20),
            BuildToolsWidget(
              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ShoesSizeScreen())),
              title: "shoesSize",icon: FontAwesomeIcons.shoePrints,),
            const SizedBox(height: 20),
            BuildToolsWidget(
              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RingSizeScreen())),
              title: "ringSize",icon: FontAwesomeIcons.ring,),
            const SizedBox(height: 20),
            BuildToolsWidget(
              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ClothesSizeScreen())),
              title: "clothesSize",icon: FontAwesomeIcons.shirt,),
            const SizedBox(height: 20),
            BuildToolsWidget(
              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LengthConverter())),
              title: "lengthConvert",icon: Icons.lens,),
            const SizedBox(height: 20),
            BuildToolsWidget(
              onTap: ()=> AutoRouter.of(context).push(AreaConverterRoute()),
              title: "areaConvert",icon: FontAwesomeIcons.chartArea,),

          ],
        ),
      ),
    );
  }
}




