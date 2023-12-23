import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/user/models/favorite_model/favorite_model.dart';
import 'package:expenses/user/screens/tools_helper/widgets/acceleration_converter/accekeration_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/area_converter/area_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/calculator/calculator_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/calender/calender_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/clothes_size/clothes_size_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/converter/converter_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/electric_converter/electric_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/length_converter/length_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/mass_converter/mass_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/qiblah/compass.dart';
import 'package:expenses/user/screens/tools_helper/widgets/ring_size/ring_size_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/shoes_size/shoes_size_screen.dart';
import 'package:expenses/user/screens/tools_helper/widgets/speed_converter/speed_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/temperature_converter/temperature_converter.dart';
import 'package:expenses/user/screens/tools_helper/widgets/time_converter/time_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expenses/user/screens/tools_helper/cubit/favorite_cubit.dart';
import 'package:local_auth/local_auth.dart';

import '../bmi_calculator/bmi_calculator_imports.dart';
import '../change_currency/change_currency_imports.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // const FavoriteScreen({Key? key}) : super(key: key);
 late final LocalAuthentication auth;

 bool _supportState = false;

 @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState((){
      _supportState = isSupported;
    }));
  }

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (context) {
        var cubit = FavoriteCubit()..getFavoriteModels();
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Favorite"),
        ),
        body: Column(
          children: [
            if(_supportState)
              const Text("This Device is supported")
            else
              const Text("This Device is is not supported"),

            ElevatedButton(onPressed: _getAvalibaleBiometrics, child: Text("Get available biometrics")),
            const SizedBox(height: 100,),

            ElevatedButton(onPressed: _authenticate, child: Text("Authenticate")),

            BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                if (state is FavoriteUpdatedState) {
                  print("=============================================");
                  print(state.favoriteTools);
                  print("=============================================");
                  return Container(
                    height: 200,
                    color: Colors.blue,
                    child: ListView.builder(
                      itemCount: state.favoriteTools.length,
                      itemBuilder: (context, index) {
                        FavoriteModel tool = state.favoriteTools[index];
                        return GestureDetector(
                          onTap: () {
                            // Navigate to the respective screen based on the tool type
                            navigateToScreen(context, tool.toolName);
                          },
                          child: ListTile(
                            title: Text(tr(context, tool.toolName)),
                            // Add onTap logic as needed
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is FavoriteExceededLimitState) {
                  return Center(
                    child: Text("Exceeded the favorite limit!"),
                  );
                } else if (state is FavoriteErrorState) {
                  return Center(
                    child: Text("Error: ${state.errorMessage}"),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void navigateToScreen(BuildContext context, String toolName) {
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

  void _getAvalibaleBiometrics()  async{
   List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
   print("List of availableBiometrics $availableBiometrics");

   if(!mounted){
     return;
   }
  }

  void _authenticate() async {
   try{
     bool authenticated = await auth.authenticate(
       localizedReason: "Subcribe or you will never find any data",
       options: const AuthenticationOptions(
         stickyAuth: true,
         biometricOnly: false,
       ),
     );
     print("Authenticated : $authenticated");
   }on PlatformException catch(e){
     print(e);
   }
  }
}

