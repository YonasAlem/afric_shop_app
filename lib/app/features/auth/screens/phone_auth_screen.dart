import 'dart:developer';

import 'package:afric_shop_app/app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/widgets.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
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
                  text: 'Your number',
                  fontSize: 20,
                ),
                SizedBox(height: AppSizes.height30),
                TextFormField(
                  readOnly: true,
                  onTap: () {
                    log('message');
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'ET Ethiopia',
                    hintStyle: TextStyle(
                      color: context.color.onBackground.withOpacity(.8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.height10),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () {
                          log('message');
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: '+ ' '251',
                          hintStyle: TextStyle(
                            color: context.color.onBackground.withOpacity(.8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(.1),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(.1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: AppSizes.width10),
                    Expanded(
                      child: TextFormField(
                        readOnly: false,
                        onTap: () {
                          log('message');
                        },
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'phone number',
                          hintStyle: TextStyle(
                            color: context.color.onBackground.withOpacity(.4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(.1),
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(.1),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color:
                                  Theme.of(context).colorScheme.primary.withOpacity(.3),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                            Navigator.pop(context);
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
                            child: const Icon(Icons.alternate_email),
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
