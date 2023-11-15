import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/models/objects/collection.dart';
import 'package:open_items/models/objects/list.dart';
import 'package:open_items/models/ordering/orderings.dart';
import 'package:open_items/models/properties/account_list_properties.dart';
import 'package:open_items/models/properties/account_properties.dart';
import 'package:open_items/utils/lang.dart';

abstract class Database {
  final StreamController<Event<DatabaseObject>> eventsController =
      StreamController<Event<DatabaseObject>>.broadcast();

  Future<void> init() async {}

  Future<String> createAccount({
    required String serverId,
    required String name,
    required String server,
    required bool isLocal,

    // Must be specified if local account
    ListsOrdering? listsOrdering,
    bool? shouldReverseOrder,
  });

  Future<String> createListe({
    required Account owner,
    required String listServerId,
    required String title,
    required CollectionType type,
    required DateTime creationTime,
    required DateTime editionTime,
  });

  Future<String> createAccountListProperties({
    required Account user, // must be local
    required String serverId,
    required String listLocalId,
    required ItemsOrdering itemsOrdering,
    required String lexoRank,
    required bool shouldReverseOrder,
    required bool shouldStackDone,
  });

  Future<String> createItem({
    required String serverId,
    required Collection parent,
    required String text,
    required CollectionType type,
    required String lexoRank,
    required DateTime creationTime,
    required DateTime editionTime,
    required DateTime doneTime,
    required bool isDone,
  });

  Account? getAccount(String accountId);
  Account? getLocalAccount(String accountId) {
    final account = getAccount(accountId);
    return account.map((a) => a.isLocal ? a : null);
  }

  AccountProperties? getAccountProperties(String accountPropertiesId);
  AccountListProperties? getAccountListProperties(
      String accountListPropertiesId);
  Liste? getListe(String listId);

  List<Account> getLocalAccounts();

  Stream<Event<DatabaseObject>> watchAll() => eventsController.stream;
  Stream<Event<DatabaseObject>> watchObject(String localId) {
    return eventsController.stream.where((event) =>
        event.object.localId == localId && event.type != EventType.delete);
  }

  Stream<Event<DatabaseObject>> watchLocalAccounts() {
    return eventsController.stream.where((event) {
      final object = event.object;
      return object is Account && object.isLocal;
    });
  }

  // Helper methods

  Future<String> createOfflineAccount({
    required String name,
  }) =>
      createAccount(
        serverId: CoreValues.offlineServer,
        name: name,
        server: CoreValues.offlineServer,
        isLocal: true,
        listsOrdering: DefaultValues.listsOrdering,
        shouldReverseOrder: DefaultValues.shouldReverse,
      );
}

abstract class DatabaseObject {
  @protected
  Database get database;

  String get localId;

  Future<void> save();
  Future<void> delete();

  void notify(EventType eventType) {
    database.eventsController.add(Event(type: eventType, object: this));
  }
}

abstract class DatabaseServerObject extends DatabaseObject {
  String get serverId;
}

enum EventType {
  delete,
  edit,
  create,
}

class Event<T extends DatabaseObject> {
  final EventType type;
  final T object;

  Event({required this.object, required this.type});
}
