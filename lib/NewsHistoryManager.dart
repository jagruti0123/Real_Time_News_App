import 'package:news_api_task/history.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryStore {
  final List<WatchedItem> history = [];
  static const String _historyKey = 'history_key';

  static final HistoryStore _instance = HistoryStore._internal();
  factory HistoryStore() => _instance;
  HistoryStore._internal();

  void addToHistory(WatchedItem watchedItem) {
    int existingIndex = history.indexWhere((item) =>
        item.title == watchedItem.title &&
        item.description == watchedItem.description);

    if (existingIndex != -1) {
      history[existingIndex] = watchedItem;
    } else {
      history.insert(0, watchedItem);
    }
    saveHistory();
  }

  // Load history from SharedPreferences
  Future<void> loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String historyJson = prefs.getString(_historyKey) ?? '[]';
    try {
      List<dynamic> historyJsonList = json.decode(historyJson);
      history.clear(); // Clear existing history before loading
      history.addAll(
          historyJsonList.map((item) => WatchedItem.fromJson(item)).toList());
    } catch (error) {
      print('Error loading history: $error');
    }
  }

  // Save history to SharedPreferences
  Future<void> saveHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String historyJson = json.encode(history);
    prefs.setString(_historyKey, historyJson);
  }

  // Remove a watched item from history
  void removeItem(WatchedItem item) {
    history.remove(item);
    saveHistory();
  }

  // Clear all history
  void clearHistory() {
    history.clear();
    saveHistory();
  }
}
