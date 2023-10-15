import 'package:flutter/material.dart';
import 'package:open_items/widgets/router/error_page.dart';

enum Routes {
  home("/"),
  list("/list"),
  item("/item"),
  sign("/sign"),
  error("/error");

  static Routes get miss => error;

  static Routes parse(String name) {
    return Routes.values.firstWhere((e) => e.name == name, orElse: () => miss);
  }

  final String name;

  const Routes(this.name);

  Widget page(Object? args) {
    switch (this) {
      case home:
        return throw UnimplementedError("Lists page"); // TODO
      case list:
        return throw UnimplementedError("List page"); // TODO
      case item:
        return throw UnimplementedError("Item page"); // TODO
      case sign:
        return throw UnimplementedError("Sign page"); // TODO
      case error:
        return RouteGenerator.errorPage;
    }
  }
}

class RouteGenerator {
  static const Widget errorPage = ErrorPage();

  static Route generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final route = Routes.parse(settings.name ?? Routes.miss.name);
    return MaterialPageRoute(builder: (_) => route.page(args));
  }
}
