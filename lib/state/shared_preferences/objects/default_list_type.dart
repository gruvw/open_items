import 'package:open_items/models/objects/collection.dart';
import 'package:open_items/state/application/globals.dart';
import 'package:open_items/state/shared_preferences/fields.dart';
import 'package:open_items/utils/lang.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'default_list_type.g.dart';

@riverpod
class DefaultListType extends _$DefaultListType {
  CollectionType _getState() {
    final defaultListType = prefs.getInt(SPFields.defaultListTypeIndexField);

    return defaultListType.map((i) => CollectionType.values[i]) ??
        CollectionType.check;
  }

  @override
  CollectionType build() {
    return _getState();
  }

  Future<void> updateType(CollectionType type) async {
    await prefs.setInt(SPFields.defaultListTypeIndexField, type.index);
    state = _getState();
  }
}
