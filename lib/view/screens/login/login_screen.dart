
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grociries_app/cubits/auth/auth_cubit.dart';
import 'package:grociries_app/cubits/auth/auth_state.dart';
import 'package:grociries_app/view/screens/home/counter_screen.dart';
import 'package:grociries_app/view_model/utils/app_assets.dart';
import 'package:grociries_app/view_model/utils/app_functions.dart';
import 'package:grociries_app/view/screens/signup/signup_screen.dart';


var hidden = true;
var unhiddenicon = Icon(Icons.visibility);
var hiddenicon = Icon(Icons.visibility_off);

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
      if(context.locale.toString()=='ar'){
        context.setLocale(Locale('en'));
      }else{
        context.setLocale(Locale('ar'));
      }
    }, icon:Icon( Icons.translate),
    )

      ),
        body: Center(
      child: Container(
        padding: EdgeInsets.all(12.w),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.loginIcon,width: 47.84.w,height: 55.64.h),
              // Image.asset('assets/images/carrot_image2.png',width: 47.84,height: 55.64),
              SizedBox(height: 120.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'logIn'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.sp),
                  ),
                  Text(
                    'enterYourPassword'.tr(),
                    style: TextStyle(color: Color(0xff7C7C7C)),
                  ),
                  SizedBox(height: 25.h),
                  // making the email field
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'email'.tr(),
                      labelStyle: TextStyle(color:  Color(0xff7C7C7C)),
                    ),
                  ),
                  // making the password field
                 BlocBuilder<AuthCubit,AuthState>(
                   buildWhen: (previous, current) {
                     return current is TogglePasswordState;
                   },
                   builder: (context, state) {
                   return  TextFormField(
                     keyboardType: TextInputType.visiblePassword,
                     textInputAction: TextInputAction.done,
                     obscureText: hidden,
                     decoration: InputDecoration(
                         helperText: 'forgetPassword?'.tr(),
                         // helper: TextButton(onPressed: (){}, child: Text('forgot passwoed ?')),
                         labelText: 'password'.tr(),
                         labelStyle: TextStyle(color:  Color(0xff7C7C7C)),
                         suffixIcon: IconButton(
                             onPressed: () {
                               AuthCubit.get(context).togglePassword();
                             },
                             icon: hidden ? hiddenicon : unhiddenicon)),
                   );
                 },),

                  SizedBox(
                    height: 40.h,
                  ),
                  BlocConsumer<AuthCubit,AuthState>(
                    listener: (context, state) {
                      if (state is LogIngSuccessfulState){
                        return  AppFunctions.navigateTo(context,HomeScreen());
                      } else if(state is LogIngErrorState){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong password"),),);
                      }

                    },
                    buildWhen: (previous, current) {
                      return current is LogIngLoadingState || current is LogIngSuccessfulState  || current is LogIngErrorState ;
                    },
                      builder: (context, state) {
                      if (state is LogIngLoadingState){
                        return Center(child: CircularProgressIndicator());
                      }else
                    return Center(
                      child: InkWell(
                        onTap: () {
                          AuthCubit.get(context).login();
                          print('');
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
                              'logIn'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600, color: Colors.white,),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                      )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('doNotHaveAnAccount?'.tr(),style: TextStyle(fontWeight: FontWeight.w600),),
                  TextButton(
                      onPressed: () {
                        AppFunctions.navigateTo(context,SignupScreen());
                      },
                      child: Text(
                        'signUp'.tr(),
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
