/* import 'dart:developer';

import 'package:afric_shop_app/app/core/type_defs.dart';
import 'package:afric_shop_app/app/features/auth/controller/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/failure.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../models/customer_model.dart';
import '../../../models/supplier_model.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: ref.watch(FirebaseProviders.authProvider),
    firestore: ref.watch(FirebaseProviders.firestoreProvider),
  ),
);

class AuthRepository {
  AuthRepository({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  })  : _auth = auth,
        _firestore = firestore;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  User? get currentUser => _auth.currentUser;
  CollectionReference get _supplier => _firestore.collection('suppliers');
  CollectionReference get _customer => _firestore.collection('customers');

  FutureEither getAuthState() async {
    AuthState? authState;
    Supplier? supplier;
    Customer? customer;
    try {
      if (currentUser == null) {
        authState = AuthState.login;
      } else {
        final supplierMap = await _supplier.doc(currentUser!.uid).get();
        if (supplierMap.exists) {
          supplier = Supplier.fromMap(supplierMap.data()! as Map<String, dynamic>);
        } else {
          final customerMap = await _customer.doc(currentUser!.uid).get();
          if (customerMap.exists) {
            customer = Customer.fromMap(customerMap.data()! as Map<String, dynamic>);
          } else {
            authState = AuthState.userInfoPending;
          }
        }
      }
      log(FirebaseAuth.instance.currentUser!.emailVerified.toString());
      return right(authState ?? supplier ?? customer);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEither<bool> signupWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return right(true);
    } on FirebaseAuthException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
 */

import 'package:afric_shop_app/app/features/auth/controller/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/failure.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/type_defs.dart';
import '../../../models/customer_model.dart';
import '../../../models/supplier_model.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: ref.watch(FirebaseProviders.authProvider),
    firestore: ref.watch(FirebaseProviders.firestoreProvider),
  ),
);

class AuthRepository {
  const AuthRepository({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  })  : _auth = auth,
        _firestore = firestore;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  User? get user => _auth.currentUser;
  CollectionReference get _supplier => _firestore.collection('suppliers');
  CollectionReference get _customer => _firestore.collection('customers');

  FutureEither getCurrentAuthState() async {
    AuthState? authState;
    Supplier? supplier;
    Customer? customer;
    try {
      if (user == null) {
        authState = AuthState.welcomeScreen;
      } else if (!user!.emailVerified) {
        authState = AuthState.verificationPending;
      } else {
        final supplierMap = await _supplier.doc(user!.uid).get();
        if (supplierMap.exists) {
          supplier = Supplier.fromMap(supplierMap.data()! as Map<String, dynamic>);
        } else {
          final customerMap = await _customer.doc(user!.uid).get();
          if (customerMap.exists) {
            customer = Customer.fromMap(customerMap.data()! as Map<String, dynamic>);
          } else {
            SharedPreferences pref = await SharedPreferences.getInstance();
            final isSupplier = pref.getBool('isSupplier');
            if (isSupplier == true) {
              authState = AuthState.supplierInfoPending;
            } else {
              authState = AuthState.customerInfoPending;
            }
          }
        }
      }
      return right(authState ?? supplier ?? customer);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEither<void> signupWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await user?.sendEmailVerification();
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEither<bool> verifyEmailAddress() async {
    try {
      await user?.reload();
      return right(user?.emailVerified ?? false);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
