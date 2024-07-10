import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/view_model/utils/app_assets.dart';
import 'package:groceries_app/view_model/utils/app_colors.dart';
import 'package:groceries_app/view_model/utils/app_functions.dart';
import 'package:groceries_app/view_model/utils/local_keys.g.dart';
import '../login/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: AppFunctions.translationIcon(context),
      bottomSheet: AppFunctions.translationFunction(context),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              AppAssets.onboardingBackground,
            ).image,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 75.h,
            ),
            Image.asset('assets/images/carrot_image.png'),
            SizedBox(
              height: 35.h,
            ),
            Text(
              LocaleKeys.welcomeToOurStore.tr(),
              style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
            ),
            SizedBox(
              height: 19.h,
            ),
            Text(
              LocaleKeys.getYourGroceriesInAsFastAsOneHour.tr(),
              style: const TextStyle(color: Colors.white70),
            ),
            SizedBox(
              height: 40.h,
            ),
            InkWell(
              onTap: () {
                AppFunctions.navigateTo(context, const LoginScreen());
              },
              child: Container(
                width: 300.w,
                height: 67.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.r),
                  color: const Color(0xff53B175),
                ),
                child: Text(
                  LocaleKeys.getStared.tr(),
                  style: TextStyle(
                      letterSpacing: 1.w,
                      color: const Color(0xffFFF9FF),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 75.h,
            )
          ],
        ),
      ),
    );
  }
}
