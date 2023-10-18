import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/text.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/state/providers/application.dart';
import 'package:open_items/widgets/router/route_generator.dart';
import 'package:open_items/widgets/utils/app_scroll_behavior.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await database.init();
  setPathUrlStrategy();

  FlutterNativeSplash.remove();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        title: UIValuesTheme.applicationTitle,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.home.name,
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(fontFamily: TextsTheme.fontFamily),
        builder: (context, child) => ScrollConfiguration(
          behavior: AppScrollBehavior(),
          child: child!,
        ),
      ),
    ),
  );
}
