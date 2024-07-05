class Shop {
  final int page;
  final int size;
  final int total;
  final List<Item> items;

  Shop({
    required this.page,
    required this.size,
    required this.total,
    required this.items,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        page: json['page'] as int,
        size: json['size'] as int,
        total: json['total'] as int,
        items:
            (json['items'] as List).map((item) => Item.fromJson(item)).toList(),
      );
}

class Item {
  final String name;
  final String? description;
  final bool isAvailable;
  final String organizationId;
  final List<Photo> photos;
  final dynamic availableQuantity; // Can be null
  final dynamic sellingPrice; // Can be null
  final dynamic discountedPrice; // Can be null
  final dynamic featuredReviews; // Can be null

  Item({
    required this.name,
    required this.description,
    required this.isAvailable,
    required this.organizationId,
    required this.photos,
    this.availableQuantity,
    this.sellingPrice,
    this.discountedPrice,
    this.featuredReviews,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json['name'] as String,
        description: json['description'],
        isAvailable: json['is_available'] as bool,
        organizationId: json['organization_id'] as String,
        photos: (json['photos'] as List)
            .map((image) => Photo.fromJson(image))
            .toList(),
        availableQuantity: json['available_quantity'],
        sellingPrice: json['selling_price'],
        discountedPrice: json['discounted_price'],
        featuredReviews: json['featured_reviews'],
      );
}

class Photo {
  final String url;

  Photo({
    required this.url,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        url: json['url'] as String,
      );
}
