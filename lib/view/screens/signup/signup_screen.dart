
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grociries_app/view/screens/home/counter_screen.dart';
import 'package:grociries_app/view_model/utils/app_assets.dart';
import 'package:grociries_app/view_model/utils/app_functions.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _signInState();
}

var hidden = true;
var unhiddenicon = Icon(Icons.visibility);
var hiddenicon = Icon(Icons.visibility_off);

class _signInState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:
         AppFunctions.translationIcon(context)
        ),
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
                    'signUp'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.sp),
                  ),
                  Text(
                    'enterYourCredentialsToContinue'.tr(),
                    style: TextStyle(color: Color(0xff7C7C7C)),
                  ),
                  SizedBox(height: 25.h),
                  // making the username field
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'userNAme'.tr(),
                      labelStyle: TextStyle(color: Color(0xff7C7C7C)),
                    ),
                  ), // making the email field
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'email'.tr(),
                      labelStyle: TextStyle(color: Color(0xff7C7C7C)),
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
                        labelText: 'password'.tr(),
                        labelStyle: TextStyle(color: Color(0xff7C7C7C)),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidden = !hidden;
                              });
                            },
                            icon: hidden ? hiddenicon : unhiddenicon)),
                  ),

                  // To create a text widget where part of the text is clickable and the rest is not and i can change the style of every part
                  RichText(
                    strutStyle:
                    StrutStyle(fontSize: 14.sp, height: 3.h),
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'byContinuingYouAgreeToOur'.tr(),
                          style: TextStyle(
                            color: Color(0xff7C7C7C),
                          ),
                        ),
                        TextSpan(
                            text: 'TermsOfServices'.tr(),
                            style: TextStyle(
                              color: Color(0xff53B175),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('terms of services clicked!')),
                                );
                              }),
                        TextSpan(
                          text: 'And'.tr(),
                          style: TextStyle(
                            color: Color(0xff7C7C7C),
                          ),
                        ),
                        TextSpan(
                            text: 'PrivacyPolicy.'.tr(),
                            style: TextStyle(
                              color: Color(0xff53B175),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
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
                    AppFunctions.navigateTo(context,HomeScreen());
                  },
                    child: Container(
                      width: 364.w,
                      height: 67.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.r),
                        color: Color(0xff53B175),
                      ),
                      child: Center(
                        child: Text(
                          'signUp'.tr(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
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
                    'alreadyHaveAnAccount?'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {
                        AppFunctions.navigateTo(
                            context, LoginScreen());
                      },
                      child: Text(
                        'logIn'.tr(),
                        style: TextStyle(color: Color(0xff53B175)),
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
