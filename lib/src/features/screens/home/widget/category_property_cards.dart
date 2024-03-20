import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realest_app/src/constants/colors.dart';
import 'package:realest_app/src/constants/icon_strings.dart';
import 'package:realest_app/src/features/controller/tabs_category_controller.dart';
import 'package:realest_app/src/features/screens/details/property_detail_screen.dart';

class CategoryPropertyCards extends StatelessWidget {
  const CategoryPropertyCards({
    super.key,
    required this.tabcontroller,
  });

  final TabAndCategoryController tabcontroller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView.builder(
          itemCount: tabcontroller.properties.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => PropertyDetailScreen(propertyId: tabcontroller.properties[index].id));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                margin: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(tabcontroller.properties[index].thumbnail),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        const Color(0xFF000000).withOpacity(0.5),
                        const Color(0xFF000000).withOpacity(0.0),
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 1,
                        left: 5,
                        right: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tabcontroller.properties[index].name,
                                  style: const TextStyle(color: tPrimaryColor, fontSize: 16),
                                ),
                                Text(
                                  '\$${tabcontroller.properties[index].price}',
                                  style: const TextStyle(color: tSearchBarColor, fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const ImageIcon(
                                  AssetImage(kfullStar),
                                  size: 16,
                                  color: Colors.yellowAccent,
                                ),
                                Text(
                                  tabcontroller.properties[index].rating.toString(),
                                  style: const TextStyle(color: tPrimaryColor, fontSize: 16),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
