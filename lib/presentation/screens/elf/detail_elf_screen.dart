import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/elf_entity.dart';
import 'package:honkai_assistance/presentation/screens/elf/child/elf_childs.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            DetailElfAppbar(elf: widget.elf),
            Padding(
              padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 24, top: 24)
                  .r,
              child: Column(
                children: [
                  ElfSpeciality(elfSpeciality: widget.elf.elfSpecialities!),
                  SizedBox(height: 24.h),
                  ElfSkill(elfSkills: widget.elf.elfSkills!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
