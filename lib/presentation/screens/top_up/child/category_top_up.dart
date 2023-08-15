import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';
import 'package:honkai_assistance/common/util/enum_state.dart';
import 'package:honkai_assistance/presentation/provider/top_up_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CategoryTopUp extends StatelessWidget {
  const CategoryTopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        padding:
            const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Center(child: Text("2", style: AppFont.subtitle)),
                ),
                SizedBox(width: 12.w),
                Text(
                  "Pilih Kategori & Item",
                  style: AppFont.subtitle.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Text("Pilih Kategori",
                style: AppFont.mediumText.copyWith(color: Colors.black)),
            SizedBox(height: 16.h),
            _listCategory(),
            SizedBox(height: 24.h),
            Text("Pilih Item",
                style: AppFont.mediumText.copyWith(color: Colors.black)),
            SizedBox(height: 16.h),
            _listItem(),
          ],
        ),
      ),
    );
  }

  Consumer _listCategory() {
    return Consumer<TopUpProvider>(
      builder: (context, topup, _) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
              topup.topUps.length,
              (index) {
                final data = topup.topUps[index];
                return Padding(
                  padding: EdgeInsets.only(
                      right: topup.topUps.length - 1 == index ? 0 : 12.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          topup.changeCategoryIndex(index);
                          topup.changeItemIndexState();
                          topup.changeItemIndex(999, 0);
                          topup.changePaymentMethodIndex(999, 0);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.5)),
                              color: topup.categoryIndex == index
                                  ? Colors.orangeAccent
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10)),
                          width: 90.w,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          child: Column(
                            children: [
                              Image.asset(data.imageAsset,
                                  width: 50.w, height: 50.h),
                              SizedBox(height: 8.h),
                              Text(data.categoryName,
                                  style: AppFont.smallText.copyWith(
                                      color: topup.categoryIndex == index
                                          ? Colors.white
                                          : Colors.black)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Consumer _listItem() {
    return Consumer<TopUpProvider>(
      builder: (context, topup, _) => topup.itemIndexState == AppState.loading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: 2 / 1.8,
              ),
              itemCount: topup.categoryIndex > 100
                  ? 0
                  : topup.topUps[topup.categoryIndex].topUpItems.length,
              itemBuilder: (context, index) {
                final data =
                    topup.topUps[topup.categoryIndex].topUpItems[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        topup.changeItemIndex(index, data.price);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.5)),
                            color: topup.itemIndex == index
                                ? Colors.orangeAccent
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(data.imageAsset,
                                width: 50.w, height: 50.h),
                            SizedBox(height: 8.h),
                            Text(data.itemName,
                                style: AppFont.boldSmallText.copyWith(
                                    color: topup.itemIndex == index
                                        ? Colors.white
                                        : Colors.black)),
                            SizedBox(height: 4.h),
                            Text(
                                "Rp. ${NumberFormat('#,##0').format(data.price)}",
                                style: AppFont.smallText.copyWith(
                                    color: topup.itemIndex == index
                                        ? Colors.white
                                        : Colors.black)),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
