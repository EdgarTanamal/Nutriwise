class HistoryModel {
  final String? id;
  final String date;
  final String totalCalorieConsumed;
  final String totalCalorieGoal;
  final String breakfastCalorie;
  final String lunchCalorie;
  final String dinnerCalorie;
  final String snackCalorie;

  HistoryModel({
    this.id,
    required this.date,
    required this.totalCalorieConsumed,
    required this.totalCalorieGoal,
    required this.breakfastCalorie,
    required this.lunchCalorie,
    required this.dinnerCalorie,
    required this.snackCalorie,
  });

  // Fungsi untuk membuat objek dari Map
  factory HistoryModel.fromMap(Map<String, dynamic> map, String id) {
    return HistoryModel(
      id: id,
      date: map['date'] ?? '',
      totalCalorieConsumed: map['totalCalorieConsumed'] ?? '',
      totalCalorieGoal: map['totalCalorieGoal'] ?? '',
      breakfastCalorie: map['breakfastCalorie'] ?? '',
      lunchCalorie: map['lunchCalorie'] ?? '',
      dinnerCalorie: map['dinnerCalorie'] ?? '',
      snackCalorie: map['snackCalorie'] ?? '',
    );
  }

  // Fungsi untuk mengubah objek menjadi Map
  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'totalCalorieConsumed': totalCalorieConsumed,
      'totalCalorieGoal': totalCalorieGoal,
      'breakfastCalorie': breakfastCalorie,
      'lunchCalorie': lunchCalorie,
      'dinnerCalorie': dinnerCalorie,
      'snackCalorie': snackCalorie,
    };
  }

  // Fungsi copyWith untuk membuat salinan objek dengan perubahan tertentu
  HistoryModel copyWith({
    String? id,
    String? date,
    String? totalCalorieConsumed,
    String? totalCalorieGoal,
    String? breakfastCalorie,
    String? lunchCalorie,
    String? dinnerCalorie,
    String? snackCalorie,
  }) {
    return HistoryModel(
      id: id ?? this.id,
      date: date ?? this.date,
      totalCalorieConsumed: totalCalorieConsumed ?? this.totalCalorieConsumed,
      totalCalorieGoal: totalCalorieGoal ?? this.totalCalorieGoal,
      breakfastCalorie: breakfastCalorie ?? this.breakfastCalorie,
      lunchCalorie: lunchCalorie ?? this.lunchCalorie,
      dinnerCalorie: dinnerCalorie ?? this.dinnerCalorie,
      snackCalorie: snackCalorie ?? this.snackCalorie,
    );
  }
}
