import 'package:dentist/app/utils/jsonRead.dart';
import 'package:mobx/mobx.dart';

part 'categories_store.g.dart';

class CategoriesStore = _CategoriesStoreBase with _$CategoriesStore;
abstract class _CategoriesStoreBase with Store {

  @observable
  ObservableList<String>? categories = ObservableList<String>();

  @action
  Future<void> loadCategories() async {

    // Parse the JSON string
    final jsonMap = await readJsonFile('assets/json/categories.json');

    // Access the 'categories' field and convert it to a list of strings
    List<String> loadedCategories = jsonMap != null ? List<String>.from(jsonMap['categories']) : [];

    categories?.clear();
    categories?.addAll(loadedCategories);
  }
}