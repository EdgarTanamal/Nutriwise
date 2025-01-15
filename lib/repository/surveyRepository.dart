import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabets/model/survey.dart';
import 'package:diabets/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SurveyRepository{
  final UserModel currentUser;

  SurveyRepository(this.currentUser);

  // Fungsi untuk mendapatkan referensi koleksi survei berdasarkan userID dari UserModel
  CollectionReference getSurveyCollection() {
    return FirebaseFirestore.instance.collection('users').doc(currentUser.id).collection('surveys');
  }


  Future<void> createSurvey(SurveyModel survey) async {
    try{
      final CollectionReference surveyCollection = getSurveyCollection();
      final docRef = await surveyCollection.add(survey.toMap());
      final updatedSurvey = survey.copyWith(id: docRef.id );
      print('Survey added successfully with ID: ${updatedSurvey.id}');


    }catch(e){
      print('Error adding Survey: $e');

    }
  }

  Future<SurveyModel?> readSurveybyUID(String surveyID) async {
    try {
      final CollectionReference surveyCollection = getSurveyCollection();
      DocumentSnapshot surveyDoc = await surveyCollection.doc(surveyID).get();

      if (surveyDoc.exists) {
        return SurveyModel.fromFirestore(surveyDoc.data() as Map<String, dynamic>, surveyDoc.id);
      } else {
        print('Survey not found');
        return null;
      }
    } catch (e) {
      print('Error fetching Survey: $e');
      return null;
    }
  }

  Future<void> updateSurvey(SurveyModel survey) async {
    try {
      final CollectionReference surveyCollection = getSurveyCollection();
      await surveyCollection.doc(survey.id).update(survey.toMap());
      print('Survey updated successfully!');
    } catch (e) {
      print('Error updating Survey: $e');
    }
  }

}