import 'package:flutter/material.dart';
import 'package:open_items/widgets/authenticate/authenticate_page.dart';
import 'package:open_items/widgets/collections/collection_page/collection_page.dart';
import 'package:open_items/widgets/collections/lists_page/lists_page.dart';
import 'package:open_items/widgets/router/error_page.dart';
import 'package:open_items/widgets/router/home_page_redirection.dart';

enum Routes {
  home("/"),
  lists("/lists"),
  collection("/collection"),
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
        return const HomePageRedirection();
      case authenticate:
        return const AuthenticatePage();
      case lists:
        if (args is String) {
          return ListsPage(accountId: args);
        }
      case collection:
        if (args is List<String> && args.length == 2) {
          return CollectionPage(
            listPropertiesId: args[0],
            collectionId: args[1],
          );
        }
      case error:
        return RouteGenerator.errorPage;
    }

    return RouteGenerator.errorPage;
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
