import 'package:shhnatycemexdriver/features/home/presentation/pages/home.dart';
import 'package:shhnatycemexdriver/features/login/presentation/pages/login-page.dart';
import 'package:shhnatycemexdriver/features/trip_detail/presentation/pages/trip-detail.dart';
import 'package:shhnatycemexdriver/features/truck_number/presentation/pages/truck-number-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/constants.dart';
import 'features/splsh/presentation/pages/splash-page.dart';

void main() async {
  /// for main to be async
  WidgetsFlutterBinding.ensureInitialized();
  /// set Orientations to be portraitUp
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  /// set statusBarColor
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  /// init shared prefs
//  await appSharedPrefs.init();
  await GetStorage.init();

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    box.writeIfNull('isFirstRun', true);

    return MaterialApp(
        color: Colors.white,
        title: 'Cemex',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primaryColor: Color.fromRGBO(196, 214, 0, 1.0),
          fontFamily: FONT_FAMILY,
          backgroundColor: Colors.white,
        ),
        initialRoute: SplashWidget.routeName,
        // onGenerateRoute: gNavigationService.onGenerateRoute,
        // navigatorKey: gNavigationService.navigationKey,
        routes: {
          SplashWidget.routeName: (context) => SplashWidget(),
          TruckNumberWidget.routeName: (context) => TruckNumberWidget(),
          LoginWidget.routeName: (context) => LoginWidget(),
          HomeWidget.routeName: (context) => HomeWidget(),
          TripDetail.routeName: (context) => TripDetail()
          // TruckNumber.routeName: (context) => TruckNumber(),
        });
  }
}
