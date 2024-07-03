import 'package:flutter/material.dart';
import 'package:grociries_app/view_model/utils/app_assets.dart';
import 'package:grociries_app/view_model/utils/app_functions.dart';
import '../login/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image:
                  Image.asset(AppAssets.onboardingBackground).image),
                  // Image.asset('assets/images/onboarding_background.png').image),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 75,
            ),
            Image.asset('assets/images/carrot_image.png'),
            SizedBox(
              height: 35,
            ),
            Image.asset('assets/images/Welcome to our store.png'),
            SizedBox(
              height: 19,
            ),
            Text(
              'Get your grociries in as fast as one hour',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                AppFunctions.navigateTo(context, LoginScreen());
              },
              child: Container(
                width: 300,
                height: 67,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Color(0xff53B175),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      letterSpacing: 1,
                      color: Color(0xffFFF9FF),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 75,
            )
          ],
        ),
      ),
    );
  }
}
