import 'package:flutter/material.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/state/providers/application.dart';
import 'package:open_items/widgets/authenticate/authenticate_page.dart';
import 'package:open_items/widgets/collections/item_page.dart';
import 'package:open_items/widgets/collections/list_page.dart';
import 'package:open_items/widgets/collections/lists_page.dart';
import 'package:open_items/widgets/router/error_page.dart';
import 'package:open_items/widgets/router/home_page.dart';

enum Routes {
  home("/"),
  lists("/lists"),
  list("/list"),
  item("/item"),
  authenticate("/authenticate"),
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
        return const HomePage();
      case lists:
        if (args is Account) {
          return ListsPage(account: args);
        }
        return RouteGenerator.errorPage;
      case list:
        return const ListPage();
      case item:
        return const ItemPage();
      case authenticate:
        return const AuthenticatePage();
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
