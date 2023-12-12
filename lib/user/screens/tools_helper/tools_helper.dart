import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/tools_helper/widgets/calculator/calculator_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/calender/calender_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/clothes_size/clothes_size_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/qiblah/compass.dart';
import 'package:expenses/user/screens/tools_helper/widgets/qiblah/qibla_widget.dart';
import 'package:expenses/user/screens/tools_helper/widgets/ring_size/ring_size_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/shoes_size/shoes_size_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToolsHelper extends StatelessWidget {
   ToolsHelper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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

          ],
        ),
      ),
    );
  }
}

class BuildToolsWidget extends StatelessWidget {
  const BuildToolsWidget({
    super.key, required this.title, this.onTap, required this.icon,
  });
final String title;
final void Function()? onTap;
final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon,color: MyColors.primary,),
          const SizedBox(width: 15,),
          MyText(title: tr(context, title), color: MyColors.primary, size: 15.sp,fontWeight: FontWeight.bold,),
        ],
      ),
    );
  }
}


