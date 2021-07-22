import 'dart:async';
import 'package:objectbox/objectbox.dart';
import '../models/models.dart';
import 'vendor_adapter.dart';

// TODO: refactor api: return object from add, update, delete? to simplify testing
class VendorRepositoryObjectbox implements VendorRepository {
  VendorRepositoryObjectbox({required Store store}) {
    try {
      this._vendorBox = store.box<VendorAdapter>();
    } on Exception {
      throw Exception('Error loading vendorObjectbox store');
    }
  }

  late Box<VendorAdapter> _vendorBox;

  @override
  Future<List<Vendor>> vendors({query = const VendorQuery()}) async {
    return Future.sync(() {
      return _vendorBox.getAll().map((e) => VendorAdapter.toVendor(e)).toList();
    });
  }

  @override
  Future<Vendor> vendor(int id) {
    return Future.sync(() {
      var e = this._vendorBox.get(id);
      if (e != null) return VendorAdapter.toVendor(e);
      throw VendorRepositoryException();
    });
  }

  @override
  Future<void> add(Vendor vendor) async {
    return Future.sync(() {
      this._vendorBox.put(VendorAdapter.fromVendor(vendor));
      return;
    });
  }

  @override
  Future<void> update(Vendor vendor) async {
    // same functionality in Objectbox
    return this.add(vendor);
  }

  @override
  Future<void> delete(Vendor vendor) async {
    Future.sync(() {
      bool isRemoved = this._vendorBox.remove(vendor.id);
      if (isRemoved) return;
      throw VendorRepositoryException();
    });
  }
}
