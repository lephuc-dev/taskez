class ProductModel {
  String? name;
  String? price;

  ProductModel({this.name, this.price});

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    price = json['price'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}
