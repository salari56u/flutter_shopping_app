class ProductModel
{
  Product? product;

  ProductModel.fromJson(dynamic json)
  {
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
}

class Product {
  int? id;
  String? title;
  String? enName;
  String? defaultPrice;
  String? deliverPrice;
  String? image;
  String? productBody;

  Product({
    this.id,
    this.title,
    this.enName,
    this.defaultPrice,
    this.deliverPrice,
    this.image,
    this.productBody,
  });

  Product.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    enName = json['en_name'];
    defaultPrice = json['default_price'];
    deliverPrice = json['deliver_price'];
    image = json['image'];
    productBody =
        json['product_body'].toString().replaceAll('&zwnj;', '').replaceAll('&nbsp;', '');
  }
}