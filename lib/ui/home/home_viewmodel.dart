import 'dart:async';
import 'package:hng_shopping_cart_timbu/models/shop.dart';
import 'package:hng_shopping_cart_timbu/services/shop_service.dart';

class ShopViewModel {
  List<Item>? _items;
  bool _isLoaded = false;
  final _controller = StreamController<void>();
  final ShopService _shopService = ShopService();

  List<Item>? get items => _items;
  bool get isLoaded => _isLoaded;

  ShopViewModel() {
    fetchShopItems();
  }

  Stream<void> get onChanged => _controller.stream;

  Future<void> fetchShopItems() async {
    try {
      Shop? shop = await _shopService.fetchShop();
      _items = shop?.items;
      _isLoaded = true;
      _controller.add(null); // Notify listeners
    } catch (e) {
      // Handle error
      _isLoaded = true;
      _controller.add(null); // Notify listeners
    }
  }

  void dispose() {
    _controller.close();
  }
}
