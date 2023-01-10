import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mtrackuser/Navigation/locator.dart';
import 'package:mtrackuser/Navigation/navigation_service.dart';
import 'package:mtrackuser/Navigation/routeGenerator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  setupLocator();
  runApp(RootRestorationScope(
      restorationId: 'root',
      child: MyApp(
        isLoggedIn: isLoggedIn,
      )));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: locator<NavigationService>().navigatorKey,
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: isLoggedIn ? '/DashboardScreen' : '/LoginScreen',
            title: 'mTrackUser',
            theme: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
          );
        });
  }
}
