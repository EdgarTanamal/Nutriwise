class FoodDetailModel {
  final String? id;
  final String foodName;
  final String amount;
  final String calorie;
  final String carbs;
  final String protein;
  final String fat;
  final String fiber;
  final String type;

  FoodDetailModel({
    this.id,
    required this.foodName,
    required this.amount,
    required this.calorie,
    required this.carbs,
    required this.protein,
    required this.fat,
    required this.fiber,
    required this.type,
  });

  // Fungsi untuk membuat objek dari Map
  factory FoodDetailModel.fromMap(Map<String, dynamic> map, [String? id]) {
    return FoodDetailModel(
      id: id,
      foodName: map['foodName'] ?? '',
      amount: map['amount'] ?? '',
      calorie: map['calorie'] ?? '',
      carbs: map['carbs'] ?? '',
      protein: map['protein'] ?? '',
      fat: map['fat'] ?? '',
      fiber: map['fiber'] ?? '',
      type: map['type'] ?? '',
    );
  }

  // Fungsi untuk mengubah objek menjadi Map
  Map<String, dynamic> toMap() {
    return {
      'foodName': foodName,
      'amount': amount,
      'calorie': calorie,
      'carbs': carbs,
      'protein': protein,
      'fat': fat,
      'fiber': fiber,
      'type': type,
    };
  }

  // Fungsi copyWith untuk membuat salinan objek dengan perubahan tertentu
  FoodDetailModel copyWith({
    String? id,
    String? foodName,
    String? amount,
    String? calorie,
    String? carbs,
    String? protein,
    String? fat,
    String? fiber,
    String? type,
  }) {
    return FoodDetailModel(
      id: id ?? this.id,
      foodName: foodName ?? this.foodName,
      amount: amount ?? this.amount,
      calorie: calorie ?? this.calorie,
      carbs: carbs ?? this.carbs,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
      fiber: fiber ?? this.fiber,
      type: type ?? this.type,
    );
  }
}
