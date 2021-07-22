import 'package:flutter_test/flutter_test.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:product_manager/core/vendors/data/vendor_adapter.dart';
import 'package:product_manager/core/vendors/data/vendor_repository_objectbox.dart';
import 'package:product_manager/core/vendors/models/models.dart';
import 'package:product_manager/objectbox.g.dart';
import 'dart:io';
import 'package:faker/faker.dart';

Future<void> main() async {
  final Store store = await _initStore();
  VendorRepositoryObjectbox vendorRepo;
  Box<VendorAdapter> vendorBox = store.box<VendorAdapter>();
  //  Fake data
  final generatedVendors = genVendors(quatity: 4);

  VendorRepositoryObjectbox storeSetup() {
    vendorBox.removeAll();
    generatedVendors.forEach((element) {
      vendorBox.put(VendorAdapter.fromVendor(element));
    });

    return VendorRepositoryObjectbox(store: store);
  }

  test('init store', () async {
    expect(store is Store, true);
  });

  group('Vendor crud => ', () {
    test('create item', () async {
      vendorRepo = storeSetup();

      int beforeBoxCount = vendorBox.count();
      await vendorRepo.add(genVendors(quatity: 1).first);

      expect(vendorBox.count(), beforeBoxCount + 1);
    });

    test('get all vendors', () async {
      vendorRepo = storeSetup();
      var allVendors = await vendorRepo.vendors();
      // Todo: test more thourouly
      expect(allVendors.length, generatedVendors.length);
    });

    test('get vendor by id', () async {
      vendorRepo = storeSetup();
      var first = (await vendorRepo.vendors()).first;
      var received = await vendorRepo.vendor(first.id);

      expect(received.id, first.id);
      expect(received.name.value, first.name.value);
      expect(received.description, first.description);
    });

    test('fails to get inexistent vendor by id', () async {
      vendorRepo = storeSetup();
      try {
        await vendorRepo.vendor(999);
        fail("exception not thrown");
      } catch (e) {
        expect(e, isInstanceOf<VendorRepositoryException>());
        // more expect statements can go here
      }
    });

    test('update vendor', () async {
      vendorRepo = storeSetup();
      var initial = (await vendorRepo.vendors()).first;
      var updated = initial.copyWith(
        name: Name('updated name' 'updated name'),
        description: 'updated description',
      );

      await vendorRepo.update(updated);

      Future future = vendorRepo.vendor(updated.id).then((value) {
        expect(value.name.value, updated.name.value);
        expect(value.description, updated.description);
      });
      expect(future, completes);
    });
  });
}

Future<Store> _initStore() async {
  final testDb = 'testDb';
  try {
    Directory dir = await getApplicationDocumentsDirectory();
    return Store(
      getObjectBoxModel(),
      directory: join(dir.path, testDb),
    );
  } on Exception {
    throw Exception('error on dir');
  }
}

List<Vendor> genVendors({int quatity = 4}) {
  return List<Vendor>.generate(
    quatity,
    (index) {
      var faker = new Faker();
      return Vendor(
        id: 0,
        name: Name(faker.company.name()),
        description: faker.lorem.sentence(),
      );
    },
  );
}
