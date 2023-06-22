import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/elf_entity.dart';
import 'package:honkai_assistance/presentation/screens/elf/child/elf_childs.dart';
import 'package:provider/provider.dart';

import '../../../common/style/style.dart';
import '../../components/loading.dart';
import '../../provider/elf_button_provider.dart';

class DetailElfScreen extends StatefulWidget {
  final ElfEntity elf;
  const DetailElfScreen({super.key, required this.elf});

  @override
  State<DetailElfScreen> createState() => _DetailElfScreenState();
}

class _DetailElfScreenState extends State<DetailElfScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() =>
        Provider.of<ElfButtonProvider>(context, listen: false).changeIndex(0));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppBar(
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              expandedHeight: 150.h,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                expandedTitleScale: 1.2,
                centerTitle: true,
                title: SizedBox(
                  height: 120.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                          imageUrl: widget.elf.urlImageATK,
                          errorWidget: (context, url, error) {
                            return const Center(
                              child: Icon(Icons.error, color: Colors.red),
                            );
                          },
                          placeholder: (context, url) {
                            return const Loading(
                                width: 30, height: 30, borderRadius: 0);
                          },
                          fit: BoxFit.fill,
                          width: 30,
                          height: 30),
                      SizedBox(width: 8.w),
                      Text(widget.elf.elfName, style: AppFont.subtitle),
                    ],
                  ),
                ),
                background: CachedNetworkImage(
                  imageUrl: widget.elf.urlImage,
                  errorWidget: (context, url, error) {
                    return const Center(
                      child: Icon(Icons.error, color: Colors.red),
                    );
                  },
                  placeholder: (context, url) {
                    return const Center(
                      child: Loading(
                          width: 200,
                          height: double.maxFinite,
                          borderRadius: 0),
                    );
                  },
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) => Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    children: [
                      ElfSpeciality(elfSpeciality: widget.elf.elfSpecialities!),
                      SizedBox(height: 24.h),
                      ElfSkill(elfSkills: widget.elf.elfSkills!),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
