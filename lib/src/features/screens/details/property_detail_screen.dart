import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:realest_app/src/constants/colors.dart';
import 'package:realest_app/src/constants/text_strings.dart';
import 'package:realest_app/src/features/models/property_model.dart';
import 'package:realest_app/src/repository/property_repository.dart';

class PropertyDetailScreen extends StatelessWidget {
  final String? propertyId;

  const PropertyDetailScreen({
    super.key,
    this.propertyId,
  });

  starRating(double rating) {
    int floor = rating.floor();
    double decimal = rating - floor;
    int remaining = 5 - floor;

    return Row(
      children: List.generate(floor, (index) {
        return const Icon(
          Icons.star,
          size: 26,
          color: Colors.yellow,
        );
      })
        ..addIf(
          decimal >= 0.5,
          const Icon(
            Icons.star_half,
            size: 26,
            color: Colors.yellow,
          ),
        )
        ..addAllIf(
          decimal >= 0.5,
          List.generate(
            remaining - 1,
            (index) {
              return const Icon(
                Icons.star_border,
                size: 26,
                color: Colors.yellow,
              );
            },
          ),
        )
        ..addAllIf(
          decimal < 0.5,
          List.generate(
            remaining,
            (index) => const Icon(
              Icons.star_border,
              size: 26,
              color: Colors.yellow,
            ),
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final propertycontroller = Get.put(PropertyRepository());
    late PropertyModel property;

    return Scaffold(
      backgroundColor: tSearchBarColor,
      body: FutureBuilder<PropertyModel>(
        future: propertycontroller.getPropertyById(propertyId!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred!'),
            );
          }

          property = snapshot.data!;

          return Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(property.thumbnail),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 24,
                left: 20,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 24,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.more_horiz_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 130,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  property.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${property.location}, New York, USA',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontSize: 16,
                                        color: const Color(0xFF808080),
                                      ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    starRating(property.rating),
                                    const SizedBox(width: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          property.rating.toString(),
                                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: tSecondaryColor,
                                              ),
                                        ),
                                        Text('-${property.reviews} Reviews',
                                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                  color: const Color(0xFF808080),
                                                ))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Column(
                            children: [
                              Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                              ),
                              SizedBox(height: 10),
                              Icon(
                                Icons.share,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          kPropertyDescription,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'urbanist',
                              ),
                        ),
                      ),
                      ReadMoreText(
                        property.description!,
                        trimLines: 3,
                        colorClickableText: Colors.blue,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: kPropertyDescriptionReadMore,
                        trimExpandedText: kPropertyDescriptionReadLess,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: const Color(0xFF808080), fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60.0,
                        width: 60.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.white,
                            border: Border.all(color: const Color(0xfff5f5f5))),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_border_rounded,
                            size: 45,
                            color: Color(0xFF808080),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60.0,
                        width: 250.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                          ),
                          child: Text(
                            'Book Now',
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
