import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/models/account.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_database.dart';
import 'package:open_items/state/providers/database.dart';

final container = ProviderContainer();
final Database database = HiveDatabase();

final offlineWelcomeMessageShownProvider = StateProvider((ref) => true);
