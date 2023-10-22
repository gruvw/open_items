import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/stores/hive/hive_database.dart';

final container = ProviderContainer();
final Database database = HiveDatabase();

final offlineWelcomeMessageShownProvider = StateProvider((ref) => true);