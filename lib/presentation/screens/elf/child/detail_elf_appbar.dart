import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/elf_entity.dart';

import '../../../../common/style/style.dart';

class DetailElfAppbar extends StatelessWidget {
  final ElfEntity elf;
  const DetailElfAppbar({super.key, required this.elf});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 150.h,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: CachedNetworkImageProvider(elf.urlImage),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 16).r,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: Colors.white, size: 30.r),
            ),
            Center(
              child: Row(
                children: [
                  Image.network(elf.urlImageATK, width: 30.w, height: 30.h),
                  SizedBox(width: 8.w),
                  Text(elf.elfName, style: AppFont.subtitle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
