import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabets/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository{
  final CollectionReference _users = FirebaseFirestore.instance.collection('users');

  Future<void> createUser(UserModel user) async {
    try{
      await _users.doc(user.id).set(user.toMap());
      print('User added successfully!');
    }catch(e){
      print('Error adding user: $e');

    }
  }

  Future<UserModel?> readUserbyUid(String userId) async {
    try {
      DocumentSnapshot userDoc = await _users.doc(userId).get();

      if (userDoc.exists) {
        return UserModel.fromFirestore(userDoc.data() as Map<String, dynamic>, userDoc.id);
      } else {
        print('User not found');
        return null;
      }
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await _users.doc(user.id).update(user.toMap());
      print('User updated successfully!');
    } catch (e) {
      print('Error updating user: $e');
    }
  }

  Future<void> deleteUserbyUid(String userId) async {
    try {
      await _users.doc().delete();
      print('User deleted successfully!');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }

  User? getCurrentUser() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return auth.currentUser;
  }
}
//
// Future<List<UserModel>> fetchAllUsers() async {
//   final CollectionReference usersCollection =
//   FirebaseFirestore.instance.collection('users');
//
//   try {
//     QuerySnapshot querySnapshot = await usersCollection.get();
//     return querySnapshot.docs
//         .map((doc) => UserModel.fromFirestore(doc.data() as Map<String, dynamic>, doc.id))
//         .toList();
//   } catch (e) {
//     print('Error fetching users: $e');
//     return [];
//   }
// }
//
//pemakaian
//List<UserModel> allUsers = await fetchAllUsers();
// for (var user in allUsers) {
//   print('User Name: ${user.name}');
// }
//


