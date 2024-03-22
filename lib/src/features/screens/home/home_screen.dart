import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realest_app/src/features/controller/tabs_category_controller.dart';
import 'package:realest_app/src/features/screens/details/property_detail_screen.dart';
import 'package:realest_app/src/features/screens/home/widget/category_property_cards.dart';
import 'package:realest_app/src/features/screens/home/widget/c_t_aand_search.dart';
import 'package:realest_app/src/features/screens/home/widget/category_tabs.dart';
import 'package:realest_app/src/features/screens/home/widget/home_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final tabcontroller = Get.put(TabAndCategoryController());
    final properties = tabcontroller.properties;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
          child: Column(
            children: <Widget>[
              /* -- App Bar -- */
              const HomeBar(),
              const SizedBox(height: 20.0),

              /* -- CTA Section -- */
              const CTAandSearch(),
              const SizedBox(height: 40.0),

              /* -- Category -- */
              /** --- Tabs --- **/
              CategoryTabs(tabcontroller: tabcontroller),
              const SizedBox(height: 20.0),
              /** --- End Tabs --- **/
              /** --- Category Cards --- **/
              CategoryPropertyCards(tabcontroller: tabcontroller),
              const SizedBox(height: 30.0),
              /** --- End Category Cards --- **/

              /** --- Properties Nearby --- **/
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Properties Nearby',
                        style: textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        )),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => SizedBox(
                  child: ListView.builder(
                    itemCount: properties.length,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Get.to(
                          () => PropertyDetailScreen(
                            propertyId: properties[index].id,
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(properties[index].name),
                        subtitle: Text(properties[index].location),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(properties[index].thumbnail),
                          radius: 40.0,
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$${properties[index].price}',
                              style: textTheme.displayLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                              ),
                            ),
                            Text(
                              properties[index].rating.toString(),
                              style: textTheme.displayLarge?.copyWith(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
