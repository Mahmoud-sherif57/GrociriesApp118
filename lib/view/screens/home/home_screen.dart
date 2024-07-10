import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceries_app/view_model/utils/app_assets.dart';
import 'package:groceries_app/view_model/utils/app_colors.dart';
import 'package:groceries_app/view_model/utils/local_keys.g.dart';
import 'package1.dart';
import 'package2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// list of image that appears in slider
  final List<String> sliderImgList = [
    // 'assets/images/chicken.png',
    // 'assets/images/apple.png',
    // 'assets/images/beef.png',
    // 'assets/images/banana.png',
    AppAssets.slider,
    AppAssets.slider,
    AppAssets.slider,
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        color: AppColors.white,
        padding: EdgeInsets.all(20.sp),
        child: ListView(
          children: [
            Image.asset(
              AppAssets.carrotIcon,
              width: 40.w,
              height: 40.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on),
                SizedBox(
                  width: 10.w,
                ),
                Text(LocaleKeys.cairoTanta.tr()),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.green,
              ),
              height: 50.h,
              child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                // to dismiss the keyboard after complete
                onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                },
                // to dismiss the keyboard on taping outside
                onTapOutside: (_) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  labelText: LocaleKeys.searchStore.tr(),
                  floatingLabelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.black),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),

            //  start Adding carouselSlider
            CarouselSlider(
              items: sliderImgList
                  .map(
                    (e) => Image.asset(
                      e,
                      fit: BoxFit.contain,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                autoPlayCurve: Curves.fastOutSlowIn,
                height: 125.h,
                viewportFraction: 0.8,
                initialPage: 0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                enlargeCenterPage: true,
                // enlargeFactor: 0.6,
                // setState to the indicator
                onPageChanged: (value, _) {
                  setState(() {
                    _currentPage = value;
                  });
                },
              ),
            ),
            // end of carousalSlider

            // a method to handle the indicator customized in the bottom of this dart file
            buildCarouselIndicator(),

            Package1Widget(),
            Package2Widget(),
            Package1Widget(),
          ],
        ),
      ),
    );
  }

// a method to build the indicator
  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < sliderImgList.length; i++)
          Container(
            margin: const EdgeInsets.all(5).w,
            width: i == _currentPage ? 10.w : 7.w,
            height: i == _currentPage ? 10.w : 7.h,
            decoration: BoxDecoration(
                color: i == _currentPage ? AppColors.green : AppColors.gray,
                shape: BoxShape.circle),
          )
      ],
    );
  }
}
