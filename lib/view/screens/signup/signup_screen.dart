
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/view/screens/home/home_screen.dart';
import 'package:groceries_app/view_model/utils/app_assets.dart';
import 'package:groceries_app/view_model/utils/app_colors.dart';
import 'package:groceries_app/view_model/utils/app_functions.dart';
import 'package:groceries_app/view_model/utils/local_keys.g.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignInState();
}

var hidden = true;
var unHiddenIcon = const Icon(Icons.visibility);
var hiddenIcon = const Icon(Icons.visibility_off);

class _SignInState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   leading:
        //  // AppFunctions.translationIcon(context)
        // ),/
        bottomSheet: AppFunctions.translationFunction(context),

        body: Center(
      child: Container(
        padding: EdgeInsets.all(12.w),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.signupIcon,
                width: 47.84.w,
                height: 55.64.h,
              ),
              SizedBox(height: 120.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.signUp.tr(),
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.sp),
                  ),
                  Text(
                    LocaleKeys.enterYourCredentialsToContinue.tr(),
                    style: const TextStyle(color:  AppColors.darkGray,),
                  ),
                  SizedBox(height: 25.h),
                  // making the username field
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.userName.tr(),
                      labelStyle: const TextStyle(color:  AppColors.darkGray,),
                    ),
                  ), // making the email field
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.email.tr(),
                      labelStyle: const TextStyle(color:  AppColors.darkGray,),
                    ),
                  ),
                  // making the password field
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: hidden,
                    decoration: InputDecoration(
                        // helperText: 'By continuing you agree to our Terms of Service and Privacy Policy.',
                        // helper: TextButton(onPressed: (){}, child: Text('forgot password ?')),
                        labelText: LocaleKeys.password.tr(),
                        labelStyle: const TextStyle(color: AppColors.darkGray,),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidden = !hidden;
                              });
                            },
                            icon: hidden ? hiddenIcon : unHiddenIcon)),
                  ),

                  // To create a text widget where part of the text is clickable and the rest is not and i can change the style of every part
                  RichText(
                    strutStyle:
                    StrutStyle(fontSize: 14.sp, height: 3.h),
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: LocaleKeys.byContinuingYouAgreeToOur.tr(),
                          style: const TextStyle(
                            color: AppColors.darkGray,
                          ),
                        ),
                        TextSpan(
                            text: LocaleKeys.termsOfServices.tr(),
                            style: const TextStyle(
                              color: AppColors.green,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('terms of services clicked!')),
                                );
                              }),
                        TextSpan(
                          text: LocaleKeys.And.tr(),
                          style: const TextStyle(
                            color: AppColors.darkGray,
                          ),
                        ),
                        TextSpan(
                            text: LocaleKeys.privacyPolicy.tr(),
                            style: const TextStyle(
                              color: AppColors.green,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('privacy policy clicked'),
                                  ),
                                );
                              }),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 40.h,
                  ),
                  InkWell(onTap: (){
                    AppFunctions.navigateTo(context,  const HomeScreen());
                  },
                    child: Container(
                      width: 364.w,
                      height: 67.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.r),
                        color:  AppColors.green,
                      ),
                      child: Center(
                        child: Text(
                          LocaleKeys.signUp.tr(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.alreadyHaveAnAccount.tr(),
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {
                        AppFunctions.navigateTo(
                            context,  const HomeScreen());
                      },
                      child: Text(
                        LocaleKeys.logIn.tr(),
                        style: const TextStyle(color:AppColors.green),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
