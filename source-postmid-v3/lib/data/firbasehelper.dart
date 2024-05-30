import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

class FirestoreHepler {
  final FirebaseFirestore _firestoreinstance = FirebaseFirestore.instance;

  FirestoreHepler._privateConstructor();

  static FirestoreHepler obj = FirestoreHepler._privateConstructor();
}
