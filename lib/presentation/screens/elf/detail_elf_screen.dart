import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/elf_entity.dart';
import 'package:honkai_assistance/presentation/provider/elf_provider.dart';
import 'package:honkai_assistance/presentation/screens/elf/child/elf_childs.dart';
import 'package:provider/provider.dart';

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

    Future.microtask(() {
      if (mounted) {
        Provider.of<ElfProvider>(context, listen: false).changeIndex(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            ElfAppBar(elf: widget.elf),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) => Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    children: [
                      ElfSpeciality(elfSpeciality: widget.elf.elfSpecialities),
                      SizedBox(height: 24.h),
                      ElfSkill(elfSkills: widget.elf.elfSkills),
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
