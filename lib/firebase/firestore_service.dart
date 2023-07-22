import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _dataCollection =
  FirebaseFirestore.instance.collection('UserInfo');

  Future<void> sendDataToFirestore({
    required String name,
    required String mobile,
    required String email,
    required String country,
  }) async {
    try {
      await _dataCollection.add({
        'name': name,
        'mobile': mobile,
        'email': email,
        'country': country,
      });
    } catch (e) {
      // Handle the error
      throw e;
    }
  }

}
