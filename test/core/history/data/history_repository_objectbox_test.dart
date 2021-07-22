import 'package:flutter_test/flutter_test.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:product_manager/core/history/history.dart';
import 'package:product_manager/objectbox.g.dart';
import 'dart:io';
import 'package:faker/faker.dart';

Future<void> main() async {
  final Store store = await _initStore();
  HistoryRepositoryObjectbox<int> historyRepo;
  Box<HistoryItemAdapter> historyBox = store.box<HistoryItemAdapter>();
  //  Fake data
  final generatedHistory = genHistory(quatity: 4);

  HistoryRepositoryObjectbox<int> storeSetup() {
    historyBox.removeAll();
    generatedHistory.forEach((element) {
      historyBox.put(HistoryItemAdapter.fromHistoryItem(element));
    });

    return HistoryRepositoryObjectbox(store: store);
  }

  test('init store', () async {
    expect(store is Store, true);
  });

  group('HfromHistoryItem crud => ', () {
    test('create item', () async {
      historyRepo = storeSetup();

      int beforeBoxCount = historyBox.count();
      await historyRepo.add(genHistory(quatity: 1).first);

      expect(historyBox.count(), beforeBoxCount + 1);
    });

    test('get all history', () async {
      historyRepo = storeSetup();
      var allHistory = await historyRepo.history();
      // Todo: test more thourouly
      expect(allHistory.length, generatedHistory.length);
    });

    test('get history by id', () async {
      historyRepo = storeSetup();
      var first = (await historyRepo.history()).first;
      var received = await historyRepo.item(first.id);

      expect(received.id, first.id);
      expect(received.userId, first.userId);
      expect(received.description, first.description);
      expect(received.origin, first.origin);
    });

    test('fails to get inexistent history by id', () async {
      historyRepo = storeSetup();
      try {
        await historyRepo.item(999);
        fail("exception not thrown");
      } catch (e) {
        expect(e, isInstanceOf<HistoryRepositoryException>());
        // more expect statements can go here
      }
    });

    test('update history', () async {
      historyRepo = storeSetup();
      var initial = (await historyRepo.history()).first;
      var updated = initial.copyWith(
        userName: 'updated name' 'updated name',
        description: 'updated description',
      );

      await historyRepo.update(updated);

      Future future = historyRepo.item(updated.id).then((value) {
        expect(value.userName, updated.userName);
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

List<HistoryItem<int>> genHistory({int quatity = 4}) {
  return List<HistoryItem<int>>.generate(
    quatity,
    (index) {
      return HistoryItem(
        id: 0,
        userId: 0,
        userName: 'admin',
        origin: 'ints',
        type: 'create',
        description: 'admin created a new int',
        details: '',
        item: 0,
        itemId: 0, //! need to create store before proceeding
      );
    },
  );
}
