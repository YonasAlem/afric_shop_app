import 'package:afric_shop_app/app/core/constants/app_sizes.dart';
import 'package:afric_shop_app/app/core/extensions/theme_extension.dart';
import 'package:afric_shop_app/app/core/widgets/widgets.dart';
import 'package:afric_shop_app/app/features/auth/screens/email_login_screen.dart';
import 'package:afric_shop_app/app/features/auth/screens/phone_auth_screen.dart';
import 'package:flutter/material.dart';

class EmailSignUpScreen extends StatefulWidget {
  const EmailSignUpScreen({super.key});

  @override
  State<EmailSignUpScreen> createState() => _EmailSignUpScreenState();
}

class _EmailSignUpScreenState extends State<EmailSignUpScreen> {
  bool _isSupplier = false;
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
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: context.color.onBackground.withOpacity(.5),
                    ),
                    isDense: true,
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: context.color.onBackground.withOpacity(.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary.withOpacity(.3),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.height10),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: context.color.onBackground.withOpacity(.5),
                    ),
                    isDense: true,
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: context.color.onBackground.withOpacity(.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary.withOpacity(.3),
                      ),
                    ),
                  ),
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
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const EmailLoginScreen()),
                        );
                      },
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
                    Material(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => const PhoneAuthScreen()),
                            );
                          },
                          borderRadius: BorderRadius.circular(14),
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(.1),
                              ),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Image.asset(
                              'assets/icons/phone.png',
                            ),
                          ),
                        ),
                      ),
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
