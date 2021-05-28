import 'package:flutter_test/flutter_test.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:product_manager/objectbox.g.dart';

main() {
  Store _store =
      Store(getObjectBoxModel()); //! TODO: error loading ffi library on init
  group('Objectbox Repository test', () {
    test('store initialized', () {
      expect(_store != null, true);
    });
  });
}
