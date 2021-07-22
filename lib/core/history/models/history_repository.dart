import 'dart:core';
import 'dart:async';
import 'models.dart';

enum HistoryFilters {
  nameAsc,
  nameDesc,
}

/// Query for history. Defaults:
///
/// `filterBy = nameDesc` and `limitTo = 25`
class HistoryQuery {
  final HistoryFilters filterBy;
  final int limitTo;

  const HistoryQuery({
    this.filterBy = HistoryFilters.nameDesc,
    this.limitTo = 25,
  });
}

enum HistoryStatus { loading, loaded, error }

class HistoryRepositoryException implements Exception {}

abstract class HistoryRepository<T> {
  Future<void> add(HistoryItem<T> vendor);

  Future<void> update(HistoryItem<T> vendor);

  Future<void> delete(HistoryItem<T> vendor);

  Future<HistoryItem<T>> item(int id);

  Future<List<HistoryItem<T>>> history({HistoryQuery query});
}
