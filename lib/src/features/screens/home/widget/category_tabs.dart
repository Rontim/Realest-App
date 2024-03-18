import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realest_app/src/features/controller/tabs_category_controller.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({
    super.key,
    required this.tabcontroller,
  });

  final TabAndCategoryController tabcontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      height: MediaQuery.of(context).size.height * 0.05,
      child: ListView.builder(
        itemCount: tabcontroller.categoryRepository.categories.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              tabcontroller.changeTab(index);
            },
            child: Obx(
              () => Container(
                margin: const EdgeInsets.only(right: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: tabcontroller.selectedIndex.value == index
                      ? const Color(0xFF000000)
                      : const Color(0xFFEFEFEF),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  tabcontroller.categoryRepository.categories[index],
                  style: TextStyle(
                    color: tabcontroller.selectedIndex.value == index
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFF000000),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
