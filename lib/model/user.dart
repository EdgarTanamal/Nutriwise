class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? profilePicture; // Nullable field

  // Constructor
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.profilePicture,
  });

  // Factory method to create a UserModel from a Firestore document
  factory UserModel.fromFirestore(Map<String, dynamic> data, String id) {
    return UserModel(
      id: id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      profilePicture: data['profilePicture'],
    );
  }

  // Convert UserModel to Map for saving to Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'profilePicture': profilePicture,
    };
  }
  // Method to copy and modify a UserModel instance
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? profilePicture,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }
}


