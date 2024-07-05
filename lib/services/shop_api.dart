import 'dart:convert';
import '../models/shop.dart';
import 'package:http/http.dart' as http;

class ShopApi {
  static Future<Shop> fetchShop() async {
    var client = http.Client();
    var uri = Uri.parse(
        "https://api.timbu.cloud/products?organization_id=9dc73eab4edd4ce5b4f9e0515cd21c2c&reverse_sort=false&Appid=GE3M4A1WCSSRISA&Apikey=265ba4f7429142ec8b8018f329a606c020240705125011968510");
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      print(Shop.fromJson(jsonDecode(response.body)).items);
      print(Shop.fromJson(jsonDecode(response.body)).items[14].photos[0].url);
      return Shop.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load shop');
    }
  }
}
