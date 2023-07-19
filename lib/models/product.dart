import 'package:flutter_rocket/flutter_rocket.dart';

const String productProductsField = "products";

const String productsIdField = "id";
const String productsTitleField = "title";
const String productsDescriptionField = "description";
const String productsPriceField = "price";
const String productsDiscountPercentageField = "discountPercentage";
const String productsRatingField = "rating";
const String productsStockField = "stock";
const String productsBrandField = "brand";
const String productsCategoryField = "category";
const String productsThumbnailField = "thumbnail";
const String productsImagesField = "images";

class Product extends RocketModel<Product> {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List? images;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  @override
  void fromJson(Map<String, dynamic> json, {bool isSub = false}) {
    id = json[productsIdField];
    title = json[productsTitleField];
    description = json[productsDescriptionField];
    price = json[productsPriceField];
    discountPercentage = json[productsDiscountPercentageField];
    rating = double.tryParse(json[productsRatingField].toString()) ?? 0.0;
    stock = json[productsStockField];
    brand = json[productsBrandField];
    category = json[productsCategoryField];
    thumbnail = json[productsThumbnailField];
    images = json[productsImagesField];
    super.fromJson(json, isSub: isSub);
  }

  void updateFields({
    int? idField,
    String? titleField,
    String? descriptionField,
    int? priceField,
    double? discountPercentageField,
    double? ratingField,
    int? stockField,
    String? brandField,
    String? categoryField,
    String? thumbnailField,
    List<String>? imagesField,
  }) {
    id = idField ?? id;
    title = titleField ?? title;
    description = descriptionField ?? description;
    price = priceField ?? price;
    discountPercentage = discountPercentageField ?? discountPercentage;
    rating = ratingField ?? rating;
    stock = stockField ?? stock;
    brand = brandField ?? brand;
    category = categoryField ?? category;
    thumbnail = thumbnailField ?? thumbnail;
    images = imagesField ?? images;
    rebuildWidget(fromUpdate: true);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data[productsIdField] = id;
    data[productsTitleField] = title;
    data[productsDescriptionField] = description;
    data[productsPriceField] = price;
    data[productsDiscountPercentageField] = discountPercentage;
    data[productsRatingField] = rating;
    data[productsStockField] = stock;
    data[productsBrandField] = brand;
    data[productsCategoryField] = category;
    data[productsThumbnailField] = thumbnail;
    data[productsImagesField] = images;

    return data;
  }

  @override
  get instance => Product();
}
