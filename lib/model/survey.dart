class SurveyModel {
  final String? id;
  final String username;
  final String gender;
  final String age;
  final String height;
  final String weight;
  final String routineActivity;
  final String purpose;

  SurveyModel({
    this.id,
    required this.username,
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
    required this.routineActivity,
    required this.purpose,
  });
  // Factory method to create a UserModel from a Firestore document
  factory SurveyModel.fromFirestore(Map<String, dynamic> data, String id) {
    return SurveyModel(
      id: id,
      username: data['username']??'',
      gender: data['gender'] ?? '',
      age: data['age'] ?? '',
      height: data['height'] ??'',
      weight: data['weight'] ??'',
      routineActivity: data['routineActivity'] ??'',
      purpose: data['purpose'] ??'',
    );
  }// Convert UserModel to Map for saving to Firestore
  Map<String, dynamic> toMap() {
    return {
      'username' : username,
      'gender': gender,
      'age': age,
      'height': height,
      'weight':weight,
      'routineActivity':routineActivity,
      'purpose':purpose
    };
  }
  // Method to copy and modify a UserModel instance
  SurveyModel copyWith({
    String? id,
    String? username,
    String? gender,
    String? age,
    String? height,
    String? weight,
    String? routineActivity,
    String? purpose
  }) {
    return SurveyModel(
      id: id ?? this.id,
      username: username ?? this.username,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      routineActivity: routineActivity ?? this.routineActivity,
      purpose: purpose ?? this.purpose,
    );
  }
}