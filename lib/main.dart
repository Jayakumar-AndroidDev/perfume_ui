import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:portion_app_ui/route/router.dart';
import 'package:portion_app_ui/ui/home_page/screen/home_page.dart';

void main() {
  final widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  runApp(
    MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteSetting.routeFunction(settings),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    ),
  );
  FlutterNativeSplash.remove();
}
