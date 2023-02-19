import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseProviders {
  static final authProvider = Provider((ref) => FirebaseAuth.instance);
  static final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);
  // static final storageProvider = Provider((ref) => FirebaseStorage.instance);
  // static final googleSignIn = Provider((ref) => GoogleSignIn());
}
