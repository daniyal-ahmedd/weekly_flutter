import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'sports_activity.dart';
import '../firebase_options.dart';

class FirebaseHelper {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  final String collectionName = "sports8A1";
  final String collectionCounter = "sportsCounter";
  FirebaseHelper._privateConstructor();

  static final FirebaseHelper _firebaseHelper =
      FirebaseHelper._privateConstructor();
  static bool _isFirstTime = true;
  static Future<FirebaseHelper> getInstance() async {
    if (_isFirstTime) {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);

      _isFirstTime = false;
    }
    return _firebaseHelper;
  }

  Future<int> existingCounter() async {
    var docRef = _instance.collection(collectionCounter).doc("counter");

    var docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      return docSnapshot.data()?['value'] ?? 1;
    }

    await docRef.set({"value": 1});
    return 1;
  }

  Future saveSportsActivity(SportsActiviy activiy) async {
    await _instance
        .collection("sports8A1")
        .doc(activiy.id)
        .set(activiy.toJsonMap());

    int counter = await _firebaseHelper.existingCounter();

    await _instance
        .collection(collectionCounter)
        .doc("counter")
        .set({"value": counter + 1});
  }

  Future removeSportsEntry(String key) async {
    await _instance.collection(collectionName).doc(key).delete();
  }

  Future<List<SportsActiviy>> getAllData() async {
    List<SportsActiviy> allGamesData = [];

    var collectionSnapshot = await _instance.collection(collectionName).get();

    for (var doc in collectionSnapshot.docs) {
      allGamesData.add(SportsActiviy.fromJsonMap(doc.data()));
    }
    return allGamesData;
  }
}
