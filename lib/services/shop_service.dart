import 'package:hng_shopping_cart_timbu/models/shop.dart';
import 'package:hng_shopping_cart_timbu/services/shop_api.dart';

class ShopService {
  Future<Shop?> fetchShop() async {
    return ShopApi.fetchShop();
  }
}
