// To parse this JSON data, do
//
//     final fotoModel = fotoModelFromJson(jsonString);

import 'dart:convert';

FotoModel fotoModelFromJson(String str) => FotoModel.fromJson(json.decode(str));

String fotoModelToJson(FotoModel data) => json.encode(data.toJson());

class FotoModel {
  int? id;
  String? name;
  String? image;
  String? url;


  FotoModel({
    required this.id,
    required this.name,
    required this.image,
    required this.url,

  });

  factory FotoModel.fromJson(Map<String, dynamic> json) => FotoModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    url: json["url"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "url": url,

  };
}
