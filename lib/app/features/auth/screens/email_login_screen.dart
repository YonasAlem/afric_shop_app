import 'package:afric_shop_app/app/core/constants/app_images.dart';
import 'package:afric_shop_app/app/core/constants/app_sizes.dart';
import 'package:afric_shop_app/app/core/extensions/theme_extension.dart';
import 'package:afric_shop_app/app/core/widgets/widgets.dart';
import 'package:afric_shop_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({super.key});

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

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
                  text: 'Welcome back',
                  fontSize: 20,
                ),
                SizedBox(height: AppSizes.height20 + AppSizes.height10),
                PrimaryTextField(
                  controller: emailController,
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: AppSizes.height10),
                PrimaryTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forget password?',
                      style: TextStyle(color: Colors.deepOrange),
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.height20),
                PrimaryTonalButton(
                  onPressed: () {},
                  text: 'CONTINUE',
                  width: double.maxFinite,
                ),
                SizedBox(height: AppSizes.height10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account, yet?"),
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.emailSignup,
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: context.color.onBackground,
                      ),
                      child: const Text(
                        'Sign Up',
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
                    SocialIconButton(
                      onPressed: () {},
                      child: Image.asset(AppImages.google),
                    ),
                    SocialIconButton(
                      onPressed: () {},
                      child: Image.asset(AppImages.guest),
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
