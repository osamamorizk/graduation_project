import 'item.dart';

class FoodDetection {
  List<Item>? items;
  String? source;
  double? confidenceAvg;

  FoodDetection({this.items, this.source, this.confidenceAvg});

  factory FoodDetection.fromJson(Map<String, dynamic> json) => FoodDetection(
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        source: json['source'] as String?,
        confidenceAvg: (json['confidence_avg'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
        'source': source,
        'confidence_avg': confidenceAvg,
      };
}
