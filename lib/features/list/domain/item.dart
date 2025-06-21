import 'package:flutter/material.dart';

class Item {
  final String id;
  final String title;
  final DateTime createdAt;
  final DateTime modifiedAt;
  final bool visible;

  Item({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.modifiedAt,
    this.visible = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'createdAt': createdAt.toIso8601String(),
      'modifiedAt': modifiedAt.toIso8601String(),
      'visible': visible,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as String,
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      modifiedAt: DateTime.parse(json['modifiedAt'] as String),
      visible: json['visible'] as bool,
    );
  }
}
