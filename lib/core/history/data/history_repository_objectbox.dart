import 'dart:async';
import 'package:objectbox/objectbox.dart';
import '../models/models.dart';
import 'history_item_adapter.dart';

class HistoryRepositoryObjectbox<T> implements HistoryRepository<T> {
  HistoryRepositoryObjectbox({required Store store}) {
    try {
      this._historyBox = store.box<HistoryItemAdapter<T>>();
    } on Exception {
      throw Exception('Error loading historyObjectbox store');
    }
  }

  late Box<HistoryItemAdapter<T>> _historyBox;

  @override
  Future<List<HistoryItem<T>>> history({query = const HistoryQuery()}) async {
    return Future.sync(() {
      return _historyBox
          .getAll()
          .map((e) => HistoryItemAdapter.toHistoryItem(e))
          .toList();
    });
  }

  @override
  Future<HistoryItem<T>> item(id) {
    return Future.sync(() {
      var e = this._historyBox.get(id);
      if (e != null) return HistoryItemAdapter.toHistoryItem(e);
      throw HistoryRepositoryException();
    });
  }

  @override
  Future<void> add(historyItem) async {
    return Future.sync(() {
      this._historyBox.put(HistoryItemAdapter.fromHistoryItem(historyItem));
      return;
    });
  }

  @override
  Future<void> update(historyItem) async {
    // same functionality in Objectbox
    return this.add(historyItem);
  }

  @override
  Future<void> delete(historyItem) async {
    Future.sync(() {
      bool isRemoved = this._historyBox.remove(historyItem.id);
      if (isRemoved) return;
      throw HistoryRepositoryException();
    });
  }
}
