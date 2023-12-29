import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/ui_themes.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/state/application/globals.dart';
import 'package:open_items/widgets/router/route_generator.dart';
import 'package:open_items/widgets/utils/navigation/app_scroll_behavior.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> setup() async {
  // Test Splash Screen
  // await Future.delayed(const Duration(seconds: 5));

  await database.init();
  setPathUrlStrategy();

  prefs = await SharedPreferences.getInstance();
}

void main() async {
  // Keep splash screen during setup
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await setup();
  FlutterNativeSplash.remove();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: UIThemes.colorScheme,
          textSelectionTheme: UIThemes.textSelectionTheme,
          visualDensity: VisualDensity.compact,
        ),
        title: UIValues.applicationTitle,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.home.name,
        onGenerateRoute: RouteGenerator.generateRoute,
        builder: (context, child) => ScrollConfiguration(
          behavior: AppScrollBehavior(),
          child: child!,
        ),
      ),
    ),
  );
}
