import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realest_app/src/features/models/property_model.dart';
import 'package:realest_app/src/repository/property_repository.dart';

class PropertyDetailScreen extends StatelessWidget {
  final String? propertyId;

  const PropertyDetailScreen({
    super.key,
    this.propertyId,
  });

  @override
  Widget build(BuildContext context) {
    final propertycontroller = Get.put(PropertyRepository());
    late PropertyModel property;

    return Scaffold(
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
              Container(
                height: MediaQuery.of(context).size.height * 0.48,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(property.thumbnail),
                    fit: BoxFit.cover,
                  ),
                ),
                foregroundDecoration: BoxDecoration(
                    // gradient: []
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
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  ),
                  child: Text(property.name),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
