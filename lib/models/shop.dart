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
  final List<Photo> photos;
  final double? availableQuantity;
  List<CurrentPrice> currentPrice;

  Item({
    required this.name,
    required this.description,
    required this.photos,
    required this.availableQuantity,
    required this.currentPrice,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json['name'] as String,
        description: json['description'],
        photos: (json['photos'] as List)
            .map((image) => Photo.fromJson(image))
            .toList(),
        availableQuantity: json['available_quantity'],
        currentPrice: (json['current_price'] as List)
            .map((price) => CurrentPrice.fromJson(price))
            .toList(),
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

class CurrentPrice {
  List<dynamic> ngn;

  CurrentPrice({
    required this.ngn,
  });

  factory CurrentPrice.fromJson(Map<String, dynamic> json) => CurrentPrice(
        ngn: List<dynamic>.from(json["NGN"].map((prices) => prices)),
      );

  Map<String, dynamic> toJson() => {
        "NGN": List<dynamic>.from(ngn.map((x) => x)),
      };
}
