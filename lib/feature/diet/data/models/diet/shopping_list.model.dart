class ShoppingList {
  String? item;
  String? quantity;

  ShoppingList({this.item, this.quantity});

  factory ShoppingList.fromJson(Map<String, dynamic> json) => ShoppingList(
        item: json['Item'] as String?,
        quantity: json['Quantity'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Item': item,
        'Quantity': quantity,
      };
}
