import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_items/models/account.dart';
import 'package:open_items/models/collection.dart';
import 'package:open_items/models/item.dart';
import 'package:open_items/models/list.dart';
import 'package:open_items/models/properties/account_list_properties.dart';

abstract class Database {
  final StreamController<Event<DatabaseObject>> eventsController =
      StreamController<Event<DatabaseObject>>.broadcast();

  Future<void> init() async {}

  Account createAccount({
    required String serverId,
    required String name,
    required String server,
    required bool isLocal,
    int? listsOrderingIndex, // must be specified if local account
  });

  Liste createListe({
    required Account owner,
    required String listServerId,
    required String title,
    required int typeIndex,
    required DateTime creationTime,
    required DateTime editionTime,
  });

  AccountListProperties createAccountListProperties({
    required Account user, // must be local
    required String serverId,
    required String listLocalId,
    required int itemsOrderingIndex,
    required String lexoRank,
    required bool shouldReverseOrder,
    required bool shouldStackDone,
  });

  Item createItem({
    required String serverId,
    required Account account,
    required Collection parent,
    required String text,
    required String position,
    required bool isDone,
    required DateTime creationTime,
    required DateTime editionTime,
    required bool isOutOfSync,
  });

  List<Account> getAccounts();
  // List<Liste> getLists();
  // List<Item> getItems();

  Stream<Event<DatabaseObject>> watchAll() => eventsController.stream;
  Stream<Event<DatabaseObject>> watchObject(DatabaseServerObject object) {
    return eventsController.stream
        .where((event) => event.object.localId == object.localId);
  }

  Stream<Event<DatabaseObject>> watchAccounts() {
    return eventsController.stream
        .where((event) => event.object.dbType == DatabaseObjectType.account);
  }
}

enum DatabaseObjectType {
  account,
  list,
  item,
  accountProperties,
  accountListProperties,
}

abstract class DatabaseObject {
  @protected
  Database get database;

  DatabaseObjectType get dbType;

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
