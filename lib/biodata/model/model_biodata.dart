// To parse this JSON data, do
//
//     final modelBio = modelBioFromJson(jsonString);

import 'dart:convert';

ModelBio modelBioFromJson(String str) => ModelBio.fromJson(json.decode(str));

String modelBioToJson(ModelBio data) => json.encode(data.toJson());

class ModelBio {
  int? id;
  String? nis;
  String? nama;
  String? kelas;

  ModelBio({
    required this.id,
    required this.nis,
    required this.nama,
    required this.kelas,
  });

  factory ModelBio.fromJson(Map<String, dynamic> json) => ModelBio(
    id: json["id"],
    nis: json["nis"],
    nama: json["nama"],
    kelas: json["kelas"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nis": nis,
    "nama": nama,
    "kelas": kelas,
  };
}
