import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_items/models/account.dart';
import 'package:open_items/models/collection.dart';
import 'package:open_items/models/item.dart';
import 'package:open_items/models/list.dart';

abstract class Database {
  final StreamController<Event<DatabaseObject>> eventsController =
      StreamController<Event<DatabaseObject>>.broadcast();

  Account createAccount({
    required String username,
    required String server, // server is set to "local" if offline account
  });

  Liste createListe({
    required Account account,
    required String title,
    required String position,
    required int typeIndex,
    required int orderIndex,
    required bool shouldReverseOrder,
    required bool shouldStackDone,
    required int creationTime,
    required int editionTime,
    required bool isOutOfSync,
  });

  Item createItem({
    required Collection parent,
    required String text,
    required String position,
    required bool isDone,
    required int creationTime,
    required int editionTime,
    required bool isOutOfSync,
  });

  List<Account> getAccounts();
  // List<Liste> getLists();
  // List<Item> getItems();

  Stream<Event<DatabaseObject>> watchAll() => eventsController.stream;
  Stream<Event<DatabaseObject>> watchObject(DatabaseObject object) {
    return eventsController.stream.where((event) => event.object.id == object.id);
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
  listProperties,
  itemProperties,
}

abstract class DatabaseObject {
  @protected
  Database get database;

  DatabaseObjectType get dbType;

  String get id;

  void delete();

  void notify(EventType eventType) {
    database.eventsController.add(Event(type: eventType, object: this));
  }
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
