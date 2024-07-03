import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grociries_app/cubits/auth/auth_cubit.dart';
import 'package:grociries_app/cubits/counter/counter_cubit.dart';
import 'package:grociries_app/view/screens/splash/splash_screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: "assets/translation",
      fallbackLocale: Locale('en'),
      child: GroceriesApp(),
    ),
  );
}

class GroceriesApp extends StatelessWidget {
  const GroceriesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => CounterCubit(),),
            BlocProvider(create: (context) => AuthCubit(),)
          ],
          child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}

// const MaterialApp(
//
// debugShowCheckedModeBanner: false,
// home: SplashScreen(),
// //
// // );
