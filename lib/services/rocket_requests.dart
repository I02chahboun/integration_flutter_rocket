import 'package:flutter_rocket/flutter_rocket.dart';
import 'package:integration_flutter_rocket/constants/api.dart';
import 'package:integration_flutter_rocket/models/product.dart';

class Request {
  static targetData(data) => data["products"];
  static Future get(Product product) {
    return Rocket.get<RocketClient>("get")
        .request(Api.product, model: product, inspect: targetData);
  }
}
