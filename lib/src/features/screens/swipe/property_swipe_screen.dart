import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realest_app/src/repository/property_repository.dart';

class PropertySwipeScreen extends StatelessWidget {
  PropertySwipeScreen({super.key});

  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final propertiesRepo = Get.put(PropertyRepository());
    final properties = propertiesRepo.properties;
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: properties.length,
        scrollDirection: Axis.vertical,
        // physics: FixedExtentScrollPhysics,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(properties[index].thumbnail),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
