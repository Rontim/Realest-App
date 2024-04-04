import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realest_app/src/constants/icon_strings.dart';
import 'package:realest_app/src/repository/property_repository.dart';

class PropertySwipeScreen extends StatelessWidget {
  PropertySwipeScreen({super.key});

  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final propertiesRepo = Get.put(PropertyRepository());
    final properties = propertiesRepo.properties;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            return Get.back();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
              (states) => const Color.fromRGBO(255, 255, 255, 0.25),
            ),
          ),
          icon: const ImageIcon(
            AssetImage(kBackIcon),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromRGBO(255, 255, 255, 0.25),
              ),
            ),
            icon: const ImageIcon(
              AssetImage(kRefreshIcon),
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
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
            child: const Stack(
              children: [
                Positioned(bottom: 1, left: 5, right: 5, child: Placeholder()),
              ],
            ),
          );
        },
      ),
    );
  }
}
