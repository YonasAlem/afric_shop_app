import 'dart:async';

import 'package:afric_shop_app/app/core/widgets/primary_filled_button.dart';
import 'package:afric_shop_app/app/features/auth/controller/auth_controller.dart';
import 'package:afric_shop_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailVerifyScreen extends ConsumerStatefulWidget {
  const EmailVerifyScreen({super.key});

  @override
  ConsumerState<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends ConsumerState<EmailVerifyScreen> {
  bool isVerified = false;
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 3), autoCheckEmailVerification);
    super.initState();
  }

  autoCheckEmailVerification(timer) async {
    if (await ref.watch(authControllerProvider.notifier).verifyEmailAddress()) {
      timer.cancel();
      setState(() => isVerified = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSupplier = ref.watch(userTypeProvider) == UserType.supplier;
    return Scaffold(
      appBar: AppBar(
        title: Text(isVerified ? 'Email verified' : 'Verify email'),
      ),
      body: Column(
        children: [
          if (isVerified)
            PrimaryFilledButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  isSupplier ? AppRoutes.supplierInfo : AppRoutes.customerInfo,
                  (route) => false,
                );
              },
              text: 'Continue as ${isSupplier ? 'Supplier' : 'Customer'}',
            ),
        ],
      ),
    );
  }
}
