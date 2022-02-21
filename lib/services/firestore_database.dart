import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {
  final FirebaseFirestore _firebaseFirestore;
  FirestoreDatabase(this._firebaseFirestore);
  Future<bool> addRecord(
      {name, college, email, mobile, interests, careerAspirations}) {
    return _firebaseFirestore
        .collection('records')
        .add({
          'name': name,
          'college': college,
          'email': email,
          'mobile': mobile,
          'interests': interests,
          'careerAspirations': careerAspirations
        })
        .then((value) => true)
        .catchError((err) => false);
  }
}
