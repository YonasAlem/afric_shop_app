import 'package:afric_shop_app/app/core/constants/app_sizes.dart';
import 'package:afric_shop_app/app/core/extensions/theme_extension.dart';
import 'package:afric_shop_app/app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_images.dart';
import '../../../routes/app_routes.dart';

class EmailSignUpScreen extends StatefulWidget {
  const EmailSignUpScreen({super.key});

  @override
  State<EmailSignUpScreen> createState() => _EmailSignUpScreenState();
}

class _EmailSignUpScreenState extends State<EmailSignUpScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  bool _isSupplier = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppSizes.height20),
            child: Column(
              children: [
                const LogoWithText(
                  logoWidth: 60,
                  textWidth: 80,
                ),
                SizedBox(height: AppSizes.height20),
                const HeadlineText(
                  text: 'Create new account',
                  fontSize: 20,
                ),
                SizedBox(height: AppSizes.height20 + AppSizes.height10),
                PrimaryTextField(
                  controller: emailController,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email,
                ),
                SizedBox(height: AppSizes.height10),
                PrimaryTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icons.lock,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: AppSizes.height50,
                    child: TextButton(
                      onPressed: () {
                        setState(() => _isSupplier = !_isSupplier);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Supplier',
                            style: TextStyle(
                              color: _isSupplier ? null : Colors.grey,
                            ),
                          ),
                          Checkbox(
                            value: _isSupplier,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            onChanged: (value) {
                              setState(() => _isSupplier = !_isSupplier);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.height20),
                PrimaryFilledButton(
                  onPressed: () {},
                  text: 'CONTINUE',
                  width: double.maxFinite,
                ),
                SizedBox(height: AppSizes.height10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.emailLogin,
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: context.color.onBackground,
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.height20),
                const SubtitleText(text: 'OR'),
                SizedBox(height: AppSizes.height20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIconButton(
                      onPressed: () => Navigator.pushNamed(context, AppRoutes.phoneAuth),
                      child: Image.asset(AppImages.phone),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
