import 'package:flutter_test/flutter_test.dart';
import 'package:dentist/app/modules/home/repository/categories_store.dart';
 
void main() {
  late CategoriesStore store;

  setUpAll(() {
    store = CategoriesStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}