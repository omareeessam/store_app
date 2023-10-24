class UpdateProductModel {
  int? id;
  String? title;
  String? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  UpdateProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  UpdateProductModel.fromJson(Map<String, dynamic> json) {
    id = (json["id"] as num).toInt();
    title = json["title"];
    price = (json["price"]);
    description = json["description"];
    category = json["category"];
    image = json["image"];
    rating = json["rating"] == null ? null : Rating.fromJson(json["rating"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["price"] = price;
    _data["description"] = description;
    _data["category"] = category;
    _data["image"] = image;
    if (rating != null) {
      _data["rating"] = rating?.toJson();
    }
    return _data;
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = (json["rate"] as num).toDouble();
    count = (json["count"] as num).toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["rate"] = rate;
    _data["count"] = count;
    return _data;
  }
}
