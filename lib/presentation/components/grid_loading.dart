import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'loading.dart';

class GridLoading extends StatelessWidget {
  const GridLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 9,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 2.8,
          mainAxisSpacing: 12,
          crossAxisSpacing: 16,
          crossAxisCount: 3),
      itemBuilder: (context, index) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Loading(
                width: 95,
                height: 95,
                borderRadius: 0,
              ),
              SizedBox(height: 8.h),
              const Loading(
                width: 85,
                height: 10,
                borderRadius: 0,
              ),
              SizedBox(height: 8.h),
              const Loading(
                width: 85,
                height: 10,
                borderRadius: 0,
              ),
            ],
          ),
        );
      },
    );
  }
}
