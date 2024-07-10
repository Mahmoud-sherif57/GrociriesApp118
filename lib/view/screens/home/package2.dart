import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'card_model.dart';

import 'package:groceries_app/view_model/utils/app_assets.dart';
import 'package:groceries_app/view_model/utils/app_colors.dart';
import 'package:groceries_app/view_model/utils/local_keys.g.dart';

class Package2Widget extends StatelessWidget {
  Package2Widget({super.key});

  final List<CardModel> cards = [
    // we can make a controller and catch this from the dashboard / and use add function to take inputs and put it in this list
    CardModel(
        image: AppAssets.rice,
        subtitle: LocaleKeys.kgPrice.tr(),
        name: LocaleKeys.rice.tr(),
        price: 4.99),
    CardModel(
        image: AppAssets.paper,
        subtitle: LocaleKeys.kgPrice.tr(),
        name: LocaleKeys.paper.tr(),
        price: 4.99),
    CardModel(
        image: AppAssets.beef,
        subtitle: LocaleKeys.kgPrice.tr(),
        name: LocaleKeys.freshBeef.tr(),
        price: 4.99),
    CardModel(
        image: AppAssets.chicken,
        subtitle: LocaleKeys.kgPrice.tr(),
        name: LocaleKeys.chicken.tr(),
        price: 4.99),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.bestSelling.tr(),
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
                Text(
                  LocaleKeys.seeAll.tr(),
                  style: const TextStyle(color: AppColors.green),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(
                width: 20.w,
              ),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10.sp),
                  width: 170.w,
                  // height: 300.h,
                  decoration: BoxDecoration(
                    // color: Colors.teal,
                    border: Border.all(color: AppColors.lightGray, width: 2.w),
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Image.asset(
                          '${cards[index].image}',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${cards[index].name}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('${cards[index].subtitle}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$ ${cards[index].price}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.sp),
                                  color: AppColors.green,
                                ),
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              // itemBuilder: (context, index) => ElementWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
