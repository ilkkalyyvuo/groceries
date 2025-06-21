import 'package:flutter/foundation.dart';
import 'package:groceries/features/list/domain/item.dart';

class GroceryList {
  final String id; // Changed from List to GroceryList
  final String title;
  final List<Item> items;
  final String description;
  final DateTime createdAt;
  final DateTime modifiedAt;
  final bool visible;

  GroceryList({
    required this.id,
    required this.title,
    this.items = const [],
    this.description = '',
    required this.createdAt,
    required this.modifiedAt,
    this.visible = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'items': items.map((item) => item.toJson()).toList(),
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'modifiedAt': modifiedAt.toIso8601String(),
      'visible': visible,
    };
  }

  factory GroceryList.fromJson(Map<String, dynamic> json) {
    return GroceryList(
      id: json['id'] as String,
      title: json['title'] as String,
      items:
          (json['items'] as List<dynamic>)
              .map(
                (itemJson) => Item.fromJson(itemJson as Map<String, dynamic>),
              )
              .toList(),
      description: json['description'] as String? ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String),
      modifiedAt: DateTime.parse(json['modifiedAt'] as String),
      visible: json['visible'] as bool? ?? true,
    );
  }
}
