import 'package:test/test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:diabets/model/user.dart';
import 'package:diabets/repository/userRepository.dart';

void main() {
  // Setup Firebase
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group('UserRepository Tests', () {
    final userRepository = UserRepository();
    final testUser = UserModel(
      id: 'testUser123',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phone: '1234567890',
      profilePicture: 'https://example.com/john_doe.jpg',
    );

    // Test Create User
    test('Create User', () async {
      await userRepository.createUser(testUser);

      final fetchedUser = await userRepository.readUserbyUid(testUser.id);

      expect(fetchedUser, isNotNull);
      expect(fetchedUser?.id, equals(testUser.id));
      expect(fetchedUser?.name, equals(testUser.name));
    });

    // Test Read User
    test('Read User', () async {
      // First, create the user
      await userRepository.createUser(testUser);

      // Now fetch the user from Firestore
      final fetchedUser = await userRepository.readUserbyUid(testUser.id);

      expect(fetchedUser, isNotNull);
      expect(fetchedUser?.id, equals(testUser.id));
      expect(fetchedUser?.email, equals(testUser.email));
    });

    // Test Update User
    test('Update User', () async {
      // Create user first
      await userRepository.createUser(testUser);

      // Update user details
      final updatedUser = testUser.copyWith(name: 'John Doe Updated');
      await userRepository.updateUser(updatedUser);

      // Fetch updated user
      final fetchedUser = await userRepository.readUserbyUid(updatedUser.id);

      expect(fetchedUser?.name, equals('John Doe Updated'));
    });

    // Test Delete User
    test('Delete User', () async {
      // Create user first
      await userRepository.createUser(testUser);

      // Delete the user
      await userRepository.deleteUserbyUid(testUser.id);

      // Try to fetch the deleted user
      final fetchedUser = await userRepository.readUserbyUid(testUser.id);

      expect(fetchedUser, isNull);
    });
  });
}
