import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabets/model/history.dart';
import 'package:intl/intl.dart';

class UserHistoryRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Referensi koleksi pengguna
  CollectionReference get _usersCollection => _firestore.collection('users');

  Future<int> getCalorieConsumedForMeal(String userId, String mealType) async {
    try {
      final today = DateTime.now();
      final dateString = "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";

      // Query dokumen history untuk tanggal hari ini
      QuerySnapshot<Map<String, dynamic>> snapshot = await _usersCollection
          .doc(userId)
          .collection('history')
          .where('date', isEqualTo: dateString)
          .limit(1) // Pastikan hanya satu dokumen
          .get();

      if (snapshot.docs.isNotEmpty) {
        // Ambil dokumen pertama dari hasil query
        final data = snapshot.docs.first.data();

        // Ambil nilai kalori berdasarkan mealType
        final calorie = int.tryParse(data[mealType]?.toString() ?? '0') ?? 0;
        return calorie;
      }

      return 0; // Jika tidak ada dokumen
    } catch (e) {
      print('Error fetching calorie consumed for $mealType: $e');
      return 0;
    }
  }

  // Pastikan dokumen history dibuat untuk hari ini jika belum ada
  Future<void> ensureDailyHistory(String userId) async {
    try {
      // Format tanggal hari ini
      String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

      // Referensi ke subkoleksi history
      CollectionReference historyCollection =
      _usersCollection.doc(userId).collection('history');

      // Cari dokumen dengan tanggal yang sesuai
      QuerySnapshot snapshot =
      await historyCollection.where('date', isEqualTo: todayDate).get();

      if (snapshot.docs.isEmpty) {
        // Jika belum ada, buat dokumen baru dengan nilai default
        HistoryModel newHistory = HistoryModel(
          date: todayDate,
          totalCalorieConsumed: '0',
          totalCalorieGoal: '0',
          breakfastCalorie: '0',
          lunchCalorie: '0',
          dinnerCalorie: '0',
          snackCalorie: '0',
        );

        await historyCollection.add(newHistory.toMap());
        print('New history document created for date $todayDate');
      } else {
        print('History document already exists for date $todayDate');
      }
    } catch (e) {
      print('Error ensuring daily history for user $userId: $e');
    }
  }

  // Tambahkan history ke subkoleksi pengguna
  Future<void> addUserHistory(String userId, HistoryModel history) async {
    try {
      await _usersCollection
          .doc(userId)
          .collection('history')
          .add(history.toMap());
      print('History added successfully for user $userId');
    } catch (e) {
      print('Error adding history for user $userId: $e');
    }
  }

  // Ambil semua history dari subkoleksi pengguna
  Future<List<HistoryModel>> getAllUserHistories(String userId) async {
    try {
      QuerySnapshot snapshot = await _usersCollection
          .doc(userId)
          .collection('history')
          .get();

      return snapshot.docs.map((doc) {
        return HistoryModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      print('Error fetching histories for user $userId: $e');
      return [];
    }
  }

  // Ambil history tertentu berdasarkan ID dari subkoleksi pengguna
  Future<HistoryModel?> getUserHistoryById(
      String userId, String historyId) async {
    try {
      DocumentSnapshot doc = await _usersCollection
          .doc(userId)
          .collection('history')
          .doc(historyId)
          .get();

      if (doc.exists) {
        return HistoryModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      } else {
        print('History with ID $historyId not found for user $userId');
        return null;
      }
    } catch (e) {
      print('Error fetching history $historyId for user $userId: $e');
      return null;
    }
  }

  // Perbarui history tertentu berdasarkan ID di subkoleksi pengguna
  Future<void> updateUserHistory(
      String userId, String historyId, HistoryModel history) async {
    try {
      await _usersCollection
          .doc(userId)
          .collection('history')
          .doc(historyId)
          .update(history.toMap());
      print('History $historyId updated successfully for user $userId');
    } catch (e) {
      print('Error updating history $historyId for user $userId: $e');
    }
  }

  // Hapus history tertentu berdasarkan ID di subkoleksi pengguna
  Future<void> deleteUserHistory(String userId, String historyId) async {
    try {
      await _usersCollection
          .doc(userId)
          .collection('history')
          .doc(historyId)
          .delete();
      print('History $historyId deleted successfully for user $userId');
    } catch (e) {
      print('Error deleting history $historyId for user $userId: $e');
    }
  }
}
