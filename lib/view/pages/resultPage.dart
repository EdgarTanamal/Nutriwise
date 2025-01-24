import 'package:flutter/material.dart';

import '../../model/history.dart';
import '../../repository/historyRepository.dart'; // Import repository yang sudah ada

class ResultPage extends StatelessWidget {
  final Map<String, dynamic> resultData;
  final String userId; // Menambahkan parameter userId untuk mengidentifikasi pengguna

  ResultPage({required this.resultData, required this.userId});

  @override
  Widget build(BuildContext context) {
    // Ambil daftar prediksi dari resultData
    var predictions = resultData['predictions'] as List;

    // Hitung total kalori
    double totalCalories = predictions.fold(10.0, (sum, item) {
      return sum + (item['calories'] ?? 10);
    });

    // Update totalCalorieConsumed di Firebase
    _updateTotalCalories(userId, totalCalories);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detection Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Predictions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: predictions.length,
                itemBuilder: (context, index) {
                  var prediction = predictions[index];
                  var foodClass = prediction['class'];
                  var confidence =
                  (prediction['confidence'] * 100).toStringAsFixed(2);
                  var calories = prediction['calories'] ?? 0;

                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        '$foodClass',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text('Confidence: $confidence%\nCalories: $calories kcal'),
                      trailing: Icon(Icons.food_bank),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Total Calories: ${totalCalories.toStringAsFixed(2)} kcal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, "/home", (route) => false); // Navigasi ke home
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Warna tombol kanan
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: Text(
            'Add Food',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk mengupdate totalCalorieConsumed di Firebase
  Future<void> _updateTotalCalories(String userId, double totalCalories) async {
    try {
      // Menggunakan repository untuk update totalCalorieConsumed
      final userHistoryRepository = UserHistoryRepository();

      // Ambil history hari ini
      await userHistoryRepository.ensureDailyHistory(userId);

      // Ambil dokumen history yang relevan
      var history = await userHistoryRepository.getUserHistoryById(userId, 'today'); // Anda bisa menggunakan ID atau tanggal spesifik

      if (history != null) {
        // Update nilai totalCalorieConsumed
        HistoryModel updatedHistory = history.copyWith(
          totalCalorieConsumed: totalCalories.toStringAsFixed(2),
        );

        await userHistoryRepository.updateUserHistory(userId, history.id!, updatedHistory);
        print('Total calories updated successfully');
      }
    } catch (e) {
      print('Error updating total calories: $e');
    }
  }
}
