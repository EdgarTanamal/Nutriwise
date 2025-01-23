import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabets/model/foodDetail.dart';

class FoodDetailRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Referensi koleksi history
  CollectionReference get _historyCollection => _firestore.collection('history');

  // Tambahkan makanan ke subkoleksi foodDetails berdasarkan tanggal tertentu
  Future<void> addFoodToHistory(String date, FoodDetailModel foodDetail) async {
    try {
      // Cari dokumen history berdasarkan tanggal
      QuerySnapshot snapshot = await _historyCollection.where('date', isEqualTo: date).get();

      if (snapshot.docs.isNotEmpty) {
        // Ambil ID dokumen history yang sesuai
        String historyId = snapshot.docs.first.id;

        // Tambahkan data foodDetail ke subkoleksi foodDetails
        await _historyCollection
            .doc(historyId)
            .collection('foodDetails')
            .add(foodDetail.toMap());
        print('Food added successfully to history $date');
      } else {
        print('No history found for the given date: $date');
      }
    } catch (e) {
      print('Error adding food to history: $e');
    }
  }

  // Ambil semua foodDetails berdasarkan tanggal tertentu
  Future<List<FoodDetailModel>> getFoodDetailsByDate(String date) async {
    try {
      // Cari dokumen history berdasarkan tanggal
      QuerySnapshot snapshot = await _historyCollection.where('date', isEqualTo: date).get();

      if (snapshot.docs.isNotEmpty) {
        // Ambil ID dokumen history yang sesuai
        String historyId = snapshot.docs.first.id;

        // Ambil semua data dari subkoleksi foodDetails
        QuerySnapshot foodSnapshot = await _historyCollection.doc(historyId).collection('foodDetails').get();
        return foodSnapshot.docs.map((doc) {
          return FoodDetailModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
        }).toList();
      } else {
        print('No history found for the given date: $date');
        return [];
      }
    } catch (e) {
      print('Error fetching food details: $e');
      return [];
    }
  }

  // Update foodDetail berdasarkan ID dan tanggal tertentu
  Future<void> updateFoodDetail(String date, String foodId, FoodDetailModel updatedFood) async {
    try {
      // Cari dokumen history berdasarkan tanggal
      QuerySnapshot snapshot = await _historyCollection.where('date', isEqualTo: date).get();

      if (snapshot.docs.isNotEmpty) {
        // Ambil ID dokumen history yang sesuai
        String historyId = snapshot.docs.first.id;

        // Update dokumen di subkoleksi foodDetails
        await _historyCollection
            .doc(historyId)
            .collection('foodDetails')
            .doc(foodId)
            .update(updatedFood.toMap());
        print('Food detail updated successfully in history $date');
      } else {
        print('No history found for the given date: $date');
      }
    } catch (e) {
      print('Error updating food detail: $e');
    }
  }

  // Hapus foodDetail berdasarkan ID dan tanggal tertentu
  Future<void> deleteFoodDetail(String date, String foodId) async {
    try {
      // Cari dokumen history berdasarkan tanggal
      QuerySnapshot snapshot = await _historyCollection.where('date', isEqualTo: date).get();

      if (snapshot.docs.isNotEmpty) {
        // Ambil ID dokumen history yang sesuai
        String historyId = snapshot.docs.first.id;

        // Hapus dokumen di subkoleksi foodDetails
        await _historyCollection
            .doc(historyId)
            .collection('foodDetails')
            .doc(foodId)
            .delete();
        print('Food detail deleted successfully from history $date');
      } else {
        print('No history found for the given date: $date');
      }
    } catch (e) {
      print('Error deleting food detail: $e');
    }
  }
}




//tambah makanan


// final foodRepo = FoodDetailRepository();
//
// final food = FoodDetailModel(
//   foodName: 'Apple',
//   amount: '150g',
//   calorie: '80',
//   carbs: '20g',
//   protein: '0.5g',
//   fat: '0g',
//   fiber: '3g',
//   type: 'fruit',
// );
//
// await foodRepo.addFoodToHistory('2025-01-23', food);
//
//
// //Ambil Semua Data Makanan Berdasarkan Tanggal
// List<FoodDetailModel> foods = await foodRepo.getFoodDetailsByDate('2025-01-23');
// for (var food in foods) {
// print('${food.foodName} - ${food.calorie} calories');
// }


//Update Data Makanan

// final updatedFood = FoodDetailModel(
// foodName: 'Banana',
// amount: '200g',
// calorie: '100',
// carbs: '30g',
// protein: '1g',
// fat: '0g',
// fiber: '2g',
// type: 'fruit',
// );
//
// await foodRepo.updateFoodDetail('2025-01-23', 'foodId123', updatedFood);
//


//Hapus Data Makanan
// await foodRepo.deleteFoodDetail('2025-01-23', 'foodId123');
