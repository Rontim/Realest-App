import 'package:get/get.dart';
import 'package:realest_app/src/features/models/property_model.dart';
import 'package:realest_app/src/repository/categories_repository.dart';
import 'package:realest_app/src/repository/property_repository.dart';

class TabAndCategoryController extends GetxController {
  static TabAndCategoryController get instance => Get.find();
  final CategoryRepository categoryRepository = Get.put(CategoryRepository());
  final PropertyRepository propertyRepository = Get.put(PropertyRepository());

  RxInt selectedIndex = 0.obs;
  RxString? selectedCategory;
  RxList<PropertyModel> properties = <PropertyModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    selectedCategory = categoryRepository.getCategory(selectedIndex.value).obs;
    properties.value = propertyRepository
        .getPropertiesByCategory(categoryRepository.getCategory(selectedIndex.value));
  }

  void changeTab(int index) {
    selectedIndex.value = index;
    selectedCategory = categoryRepository.getCategory(selectedIndex.value).obs;
    properties.value = propertyRepository
        .getPropertiesByCategory(categoryRepository.getCategory(selectedIndex.value));
  }
}
