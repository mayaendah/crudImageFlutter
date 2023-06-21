// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  int? id;
  String? text;
  int? completed;
  DateTime? createdAt;

  TodoModel({
    required this.id,
    required this.text,
    required this.completed,
    required this.createdAt,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
    id: json["id"],
    text: json["text"],
    completed: json["completed"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "completed": completed,
    "created_at": createdAt!.toIso8601String(),
  };
}
