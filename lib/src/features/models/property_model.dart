class PropertyModel {
  final String? id;
  final String name;
  final String location;
  final double price;
  final String thumbnail;
  final double rating;

  final int? reviews;

  final String? description;
  final String category;
  final List<String>? images;

  PropertyModel({
    this.id,
    required this.name,
    required this.location,
    required this.price,
    required this.thumbnail,
    required this.rating,
    this.reviews,
    this.description,
    required this.category,
    this.images,
  });
}
