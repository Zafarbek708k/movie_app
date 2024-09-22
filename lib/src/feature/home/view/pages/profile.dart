import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/constants/context_extension.dart';
import 'package:movie_app/src/core/widgets/text_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 35),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 120.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [Colors.red, Colors.deepOrange, Colors.deepOrangeAccent, Colors.yellow, Colors.lightGreenAccent],
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: context.appTheme.primary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 5),
                      // logo
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Container(
                            height: 90.h,
                            width: 80.h,
                            decoration: BoxDecoration(
                              color: context.appTheme.primary,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: context.appTheme.secondary),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/app_logo.png"),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0, top: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                "Ism: Zafarbek",
                                textColor: context.appTheme.secondary,
                                fontSize: 14,
                              ),
                              CustomTextWidget(
                                "Telefon Raqami: +998976252979",
                                textColor: context.appTheme.secondary,
                                fontSize: 12,
                              ),
                              CustomTextWidget(
                                "Balans: 0 UZS",
                                textColor: context.appTheme.secondary,
                                fontSize: 12,
                              ),
                              CustomTextWidget(
                                "Id: 3075588",
                                textColor: context.appTheme.secondary,
                                fontSize: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomRowWidget(
              leadingIcon: Icons.account_balance_wallet,
              text: 'Balansni to\'ldirish',
              trailingIcon: Icons.chevron_right,
              onPressed: (){},
            ),
            CustomRowWidget(
              leadingIcon: Icons.assignment,
              text: 'Tarif sotib olish',
              trailingIcon: Icons.chevron_right,
              onPressed: (){},
            ),
            CustomRowWidget(
              leadingIcon: Icons.done_outline,
              text: 'Sotib olingan tariflar',
              trailingIcon: Icons.chevron_right,
              onPressed: (){},
            ),
            CustomRowWidget(
              leadingIcon: Icons.history_edu_rounded,
              text: 'Tolovlar tarixi',
              trailingIcon: Icons.chevron_right,
              onPressed: (){},
            ),
            CustomRowWidget(
              leadingIcon: Icons.edit_note_outlined,
              text: 'Buyurtmalar',
              trailingIcon: Icons.chevron_right,
              onPressed: (){},
            ),
            CustomRowWidget(
              leadingIcon: Icons.monetization_on_outlined,
              text: 'Tarif sotib olish',
              trailingIcon: Icons.chevron_right,
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRowWidget extends StatelessWidget {
  final IconData leadingIcon;
  final String text;
  final IconData trailingIcon;
  final VoidCallback? onPressed; // Corrected to VoidCallback

  const CustomRowWidget({
    super.key,
    required this.leadingIcon,
    required this.text,
    required this.trailingIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CupertinoButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(leadingIcon, color: context.appTheme.secondary), // Custom context extension
            const SizedBox(width: 16.0),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: context.appTheme.secondary, // Custom theme color
                  fontSize: 16.0,
                ),
              ),
            ),
            Icon(trailingIcon, color: context.appTheme.secondary),
          ],
        ),
      ),
    );
  }
}
