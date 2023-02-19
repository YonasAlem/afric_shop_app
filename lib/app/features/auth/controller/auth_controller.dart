import 'dart:developer';

import 'package:afric_shop_app/app/core/extensions/app_navigator.dart';
import 'package:afric_shop_app/app/core/local/storage_preference.dart';
import 'package:afric_shop_app/app/models/customer_model.dart';
import 'package:afric_shop_app/app/models/supplier_model.dart';
import 'package:afric_shop_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_repository.dart';

enum AuthState {
  welcomeScreen,
  verificationPending,
  customerInfoPending,
  supplierInfoPending,
  customerHome,
  supplierHome,
}

enum UserType { customer, supplier }

final userTypeProvider = StateProvider<UserType>((ref) => UserType.customer);
final supplierProvider = StateProvider<Supplier?>((ref) => null);
final customerProvider = StateProvider<Customer?>((ref) => null);

final getCurrenAuthStateProvider = FutureProvider(
  (ref) {
    final authController = ref.watch(authControllerProvider.notifier);
    return authController.getCurrentAuthState();
  },
);

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(repository: authRepository, ref: ref);
});

class AuthController extends StateNotifier<AuthState> {
  final AuthRepository _repository;
  final Ref _ref;

  AuthController({
    required AuthRepository repository,
    required Ref ref,
  })  : _repository = repository,
        _ref = ref,
        super(AuthState.welcomeScreen);

  Future<AuthState> getCurrentAuthState() async {
    final result = await _repository.getCurrentAuthState();

    AuthState authState = AuthState.welcomeScreen;

    result.fold((l) => log(l.message), (r) {
      if (r is AuthState) {
        authState = r;
      } else if (r is Supplier) {
        _ref.read(supplierProvider.notifier).update((state) => r);
        _ref.read(userTypeProvider.notifier).update((state) => UserType.supplier);
        authState = AuthState.supplierHome;
      } else if (r is Customer) {
        _ref.read(customerProvider.notifier).update((state) => r);
        _ref.read(userTypeProvider.notifier).update((state) => UserType.customer);
        authState = AuthState.customerHome;
      }
    });
    return authState;
  }

  signupWithEmailAndPassword({
    required String email,
    required String password,
    required bool isSupplier,
    required BuildContext context,
  }) async {
    StoragePreference.setBoolValue('isSupplier', isSupplier);

    final result = await _repository.signupWithEmailAndPassword(email, password);

    result.fold(
      (l) => log(l.message),
      (r) {
        state = AuthState.verificationPending;
        context.pushAndRemove(route: AppRoutes.emailVerify);
      },
    );
  }

  Future<bool> verifyEmailAddress() async {
    final result = await _repository.verifyEmailAddress();
    bool isVerified = false;
    result.fold((l) => log(l.message), (r) {
      state = AuthState.customerInfoPending;
      isVerified = r;
    });

    return isVerified;
  }
}
