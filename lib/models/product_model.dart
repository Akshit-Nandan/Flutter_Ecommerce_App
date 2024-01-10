import 'dart:convert';

ProdutModel produtModelFromJson(String str) => ProdutModel.fromJson(json.decode(str));

String produtModelToJson(ProdutModel data) => json.encode(data.toJson());

class ProdutModel {
    String id;
    String name;
    String image;
    int price;
    String description;
    bool status;
    bool isFav;

    ProdutModel({
        required this.id,
        required this.name,
        required this.image,
        required this.price,
        required this.description,
        required this.status,
        required this.isFav,
    });

    factory ProdutModel.fromJson(Map<String, dynamic> json) => ProdutModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        description: json["description"],
        status: json["status"],
        isFav: json["isFav"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "description": description,
        "status": status,
        "isFav": isFav,
    };
}
