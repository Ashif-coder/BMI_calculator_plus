import 'package:bmi/constants/color_manger.dart';
import 'package:bmi/provider/providers.dart';
import 'package:bmi/screens/home_screen/input_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
  ]);
  runApp(BMICalculator());
}
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: ScreenUtilInit(
        designSize: const Size(360, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
            theme: ThemeData.dark().copyWith(
              primaryColor:ColorManager.kPrimaryColor,
              scaffoldBackgroundColor: ColorManager.kScaffoldColor,
            ),
            home: InputPage(),
            debugShowCheckedModeBanner:false
        ),
      )
    );
  }
}
