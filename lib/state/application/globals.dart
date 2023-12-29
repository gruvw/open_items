import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/stores/hive/hive_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

final container = ProviderContainer();
final Database database = HiveDatabase(); // gloabal dependency injection
late SharedPreferences prefs; // assigned in main
