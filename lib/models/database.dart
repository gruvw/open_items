import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/models/objects/collection.dart';
import 'package:open_items/models/objects/item.dart';
import 'package:open_items/models/objects/list.dart';
import 'package:open_items/models/properties/account_list_properties.dart';
import 'package:open_items/models/properties/account_properties.dart';

abstract class Database {
  final StreamController<Event<DatabaseObject>> eventsController =
      StreamController<Event<DatabaseObject>>.broadcast();

  Future<void> init() async {}

  Account createAccount({
    required String serverId,
    required String name,
    required String server,
    required bool isLocal,
    ListsOrdering? listsOrdering, // must be specified if local account
  });

  Liste createListe({
    required Account owner,
    required String listServerId,
    required String title,
    required CollectionType type,
    required DateTime creationTime,
    required DateTime editionTime,
  });

  AccountListProperties createAccountListProperties({
    required Account user, // must be local
    required String serverId,
    required String listLocalId,
    required ItemsOrdering itemsOrdering,
    required String lexoRank,
    required bool shouldReverseOrder,
    required bool shouldStackDone,
  });

  Item createItem({
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

  Option<Account> getLocalAccount(String accountId);
  List<Account> getLocalAccounts();

  Stream<Event<DatabaseObject>> watchAll() => eventsController.stream;
  Stream<Event<DatabaseObject>> watchObject(DatabaseServerObject object) {
    return eventsController.stream
        .where((event) => event.object.localId == object.localId);
  }

  Stream<Event<DatabaseObject>> watchLocalAccounts() {
    return eventsController.stream.where((event) {
      final object = event.object;
      return object is Account && object.isLocal;
    });
  }

  // Helper methods

  Account createOfflineAccount({
    required String name,
  }) =>
      createAccount(
        serverId: CoreValues.offlineServer,
        name: name,
        server: CoreValues.offlineServer,
        isLocal: true,
        listsOrdering: CoreValues.defaultListsOrdering,
      );
}

abstract class DatabaseObject {
  @protected
  Database get database;

  String get localId;

  void delete();

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
