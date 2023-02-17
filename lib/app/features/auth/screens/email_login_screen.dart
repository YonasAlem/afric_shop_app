import 'package:afric_shop_app/app/core/constants/app_sizes.dart';
import 'package:afric_shop_app/app/core/extensions/theme_extension.dart';
import 'package:afric_shop_app/app/core/widgets/widgets.dart';
import 'package:afric_shop_app/app/features/auth/screens/email_sign_up_screen.dart';
import 'package:flutter/material.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({super.key});

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
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
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forget password?',
                      style: TextStyle(color: Colors.deepOrange),
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
                    const Text("Don't have an account, yet?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const EmailSignUpScreen()),
                        );
                      },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Or",
                      style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .color!
                            .withOpacity(.2),
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.height20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: InkWell(
                          onTap: () {},
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
                    Material(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: InkWell(
                          onTap: () {},
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
                              'assets/icons/google.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: InkWell(
                          onTap: () {},
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
                              'assets/icons/guest.png',
                            ),
                          ),
                        ),
                      ),
                    )
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
