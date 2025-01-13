class SurveyModel {
  final String id;
  final String question;
  final String answer;

  SurveyModel({
    required this.id,
    required this.question,
    required this.answer,
  });
  // Factory method to create a UserModel from a Firestore document
  factory SurveyModel.fromFirestore(Map<String, dynamic> data, String id) {
    return SurveyModel(
      id: id,
      question: data['question'] ?? '',
      answer: data['answer'] ?? '',
    );
  }// Convert UserModel to Map for saving to Firestore
  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answer': answer,
    };
  }
  // Method to copy and modify a UserModel instance
  SurveyModel copyWith({
    String? id,
    String? question,
    String? answer,
  }) {
    return SurveyModel(
      id: id ?? this.id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }
}