import 'package:get/get.dart';
import 'package:realest_app/src/constants/text_strings.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  late RxList<String> categories = List.of(kHomeTabs).obs;

  void addCategory(String category) {
    categories.add(category);
  }

  void removeCategory(int index) {
    categories.removeAt(index);
  }

  void updateCategory(int index, String category) {
    categories[index] = category;
  }

  String getCategory(int index) {
    return categories[index];
  }

  List<String> getCategories() {
    return categories.toList();
  }
}
