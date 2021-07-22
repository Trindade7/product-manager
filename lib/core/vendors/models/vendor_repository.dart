import 'dart:core';
import 'dart:async';
import 'models.dart';

enum VendorFilters {
  nameAsc,
  nameDesc,
}

/// Query for product vendors. Defaults:
///
/// `filterBy = nameDesc` and `limitTo = 25`
class VendorQuery {
  final VendorFilters filterBy;
  final int limitTo;

  const VendorQuery({
    this.filterBy = VendorFilters.nameDesc,
    this.limitTo = 25,
  });
}

enum VendorStatus { loading, loaded, error }

class VendorRepositoryException implements Exception {}

abstract class VendorRepository {
  Future<void> add(Vendor vendor);

  Future<void> update(Vendor vendor);

  Future<void> delete(Vendor vendor);

  Future<Vendor> vendor(int id);

  Future<List<Vendor>> vendors({VendorQuery query});
}
