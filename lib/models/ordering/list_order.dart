import 'package:open_items/models/account.dart';
import 'package:open_items/models/account_properties.dart';
import 'package:open_items/models/list.dart';

int Function(Liste, Liste) listsOrdering(Account account) {
  final properties = account.properties!;
  final order = properties.listsOrdering;

  int listPositionCompare(Liste l1, Liste l2) {
    final l1Properties = properties.listProperties(l1);
    final l2Properties = properties.listProperties(l2);

    switch (order) {
      case ListsOrdering.alphabetical:
        return l1.title.compareTo(l2.title);
      case ListsOrdering.creation:
        return l1.creationTime.compareTo(l2.creationTime);
      case ListsOrdering.edition:
        return l1.editionTime.compareTo(l2.editionTime);
      case ListsOrdering.custom:
        return l1Properties.lexoRank.compareTo(l2Properties.lexoRank);
    }
  }

  return listPositionCompare;
}
