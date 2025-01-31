import 'item.model.dart';

class Meal {
  String? name;
  List<Item>? items;

  Meal({this.name, this.items});

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        name: json['Name'] as String?,
        items: (json['Items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'Name': name,
        'Items': items?.map((e) => e.toJson()).toList(),
      };
}
