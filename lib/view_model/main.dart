import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubits/auth/auth_cubit.dart';
import 'package:groceries_app/cubits/counter/counter_cubit.dart';
import 'package:groceries_app/view/screens/splash/splash_screens.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: "assets/translation",
      fallbackLocale: const Locale('en'),
      child: const GroceriesApp(),
    ),
  );
}

class GroceriesApp extends StatelessWidget {
  const GroceriesApp({super.key});

  @override
  Widget build(BuildContext context) {
    // we wrapped the multiBlocProvider with ScreenUtilInit to handle the responsive UI,
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (_, child) {
        // we wrapped the MaterialAPP with multiBlocProvider to handle the stateManagement,
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => CounterCubit(),),
            BlocProvider(create: (context) => AuthCubit(),)
          ],
          child: MaterialApp(
            // to handle the localization
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          ),
        );
      },
    );
  }
}




/// to generate the locale keys
/// flutter pub run easy_localization:generate -S assets/translation -O lib/view_model/utils -o local_keys.g.dart -f keys