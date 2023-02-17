import 'package:afric_shop_app/app/core/constants/app_sizes.dart';
import 'package:afric_shop_app/app/core/extensions/theme_extension.dart';
import 'package:afric_shop_app/app/core/widgets/primary_filled_button.dart';
import 'package:flutter/material.dart';

class CustomerInfoScreen extends StatelessWidget {
  const CustomerInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSizes.height20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 75,
                backgroundColor: context.color.primary.withOpacity(.1),
                child: CircleAvatar(
                  radius: 73,
                  backgroundColor: context.color.background,
                  child: CircleAvatar(
                    radius: 68,
                    backgroundColor: context.color.secondary.withOpacity(.3),
                    child: const Icon(
                      Icons.photo_camera,
                      size: 34,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.height20),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: context.color.onBackground.withOpacity(.5),
                  ),
                  isDense: true,
                  labelText: 'Username (required)',
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
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: context.color.onBackground.withOpacity(.5),
                  ),
                  isDense: true,
                  labelText: 'email (optional)',
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
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: context.color.onBackground.withOpacity(.5),
                  ),
                  isDense: true,
                  labelText: 'phone number (optional)',
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
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: context.color.onBackground.withOpacity(.5),
                  ),
                  isDense: true,
                  labelText: 'Address (optional)',
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
              SizedBox(height: AppSizes.height20),
              PrimaryFilledButton(
                onPressed: () {},
                width: double.maxFinite,
                text: 'Save and Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
