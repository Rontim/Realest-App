import 'package:get/get.dart';
import 'package:realest_app/src/features/models/property_model.dart';
import 'package:realest_app/src/utils/data/dummy_properties.dart';

class PropertyRepository extends GetxController {
  static PropertyRepository get instance => Get.find();

  late RxList<PropertyModel> properties = dummyProperties.obs;

  List<PropertyModel> getProperties() {
    return properties;
  }

  List<PropertyModel> getPropertiesByCategory(String category) {
    return properties.where((property) => property.category == category).toList();
  }

  List<PropertyModel> searchProperties(String query) {
    return properties
        .where((property) => property.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<PropertyModel> getPropertiesByLocation(String location) {
    return properties
        .where((property) => property.location.toLowerCase().contains(location.toLowerCase()))
        .toList();
  }

  List<PropertyModel> getPropertiesByRating(double rating) {
    return properties.where((property) => property.rating == rating).toList();
  }

  List<PropertyModel> getPropertiesByPriceRange(double min, double max) {
    return properties.where((property) => property.price >= min && property.price <= max).toList();
  }

  Future<PropertyModel> getPropertyById(String id) async {
    Duration duration = const Duration(seconds: 2);

    return Future.delayed(duration, () {
      return properties.firstWhere((property) => property.id == id);
    });
  }
}
