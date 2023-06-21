import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/components/title_line.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';
import '../../../../domain/entities/elf_entity.dart';
import '../../../components/loading.dart';
import '../../../provider/elf_button_provider.dart';

class ElfSkill extends StatelessWidget {
  final List<ElfSkillEntity> elfSkills;

  const ElfSkill({super.key, required this.elfSkills});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Skill", style: AppFont.subtitle),
        SizedBox(height: 16.h),
        Container(
          decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(10)),
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16).r,
            child: _gridSkillImage(),
          ),
        ),
        SizedBox(height: 16.h),
        Text("Skill Description", style: AppFont.subtitle),
        SizedBox(height: 16.h),
        Container(
          decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(10)),
          width: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: _descriptionSkill(),
          ),
        ),
      ],
    );
  }

  GridView _gridSkillImage() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: elfSkills.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8, crossAxisSpacing: 8, crossAxisCount: 4),
      itemBuilder: (context, index) {
        return Consumer<ElfButtonProvider>(
          builder: (context, elfButton, _) => GestureDetector(
            onTap: () {
              elfButton.changeIndex(index);
            },
            child: Container(
              alignment: Alignment.center,
              width: 66.w,
              height: 66.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                    color:
                        elfButton.index == index ? AppColor.red : AppColor.blue,
                    width: 2),
              ),
              child: CachedNetworkImage(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  imageUrl: elfSkills[index].urlImage,
                  errorWidget: (context, url, error) {
                    return const Center(
                      child: Icon(Icons.error, color: AppColor.red),
                    );
                  },
                  placeholder: (context, url) {
                    return const Loading(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        borderRadius: 100);
                  },
                  fit: BoxFit.fill),
            ),
          ),
        );
      },
    );
  }

  Consumer _descriptionSkill() {
    return Consumer<ElfButtonProvider>(
      builder: (context, elfButton, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleLine(
              title: elfSkills[elfButton.index].skillName,
              height: 35,
              fontSize: 12),
          SizedBox(height: 8.h),
          Text(elfSkills[elfButton.index].descriptionSkill,
              style: AppFont.smallText, textAlign: TextAlign.justify),
        ],
      ),
    );
  }
}
