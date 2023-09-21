abstract class ExportFields {
  static const String lists = "lists";
  static const String version = "version";
}

abstract class CollectionFields {
  static const String creationTime = "creationTime";
  static const String editionTime = "editionTime";
}

abstract class ListFields {
  static const String title = "title";
  static const String typeIndex = "typeIndex";
  static const String orderIndex = "orderIndex";
  static const String shouldReverseOrder = "shouldReverseOrder";
  static const String shouldStackDone = "shouldStackDone";
  static const String positon = "position";
  static const String items = "items";
}

abstract class ItemFields {
  static const String doneTime = "doneTime";
  static const String text = "text";
  static const String isDone = "isDone";
  static const String position = "position";
  static const String subitems = "subitems";
}
