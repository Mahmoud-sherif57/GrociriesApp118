import 'package:flutter/material.dart';
import 'package:groceries_app/view_model/utils/app_assets.dart';
import 'package:groceries_app/view_model/utils/app_functions.dart';
import '../onbording/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> onboardingScreen(),),);
      AppFunctions.navigateTo(context, const OnboardingScreen());
         });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff53B175),
      body: Center(child: Image.asset(AppAssets.splashLogo,fit: BoxFit.cover,),),
      // body: Center(child: Image.asset("assets/images/splash_logo.png"),),
    );
  }
}
