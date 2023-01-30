import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/providers/character_banner_provider.dart';
import 'package:honkai_assistance/presentation/providers/elf_banner_provider.dart';
import 'package:honkai_assistance/presentation/providers/equipment_banner_provider.dart';
import 'package:honkai_assistance/presentation/providers/event_provider.dart';

import 'package:honkai_assistance/presentation/providers/news_update_provider.dart';
import 'package:honkai_assistance/presentation/providers/redeem_code_provider.dart';
import 'package:honkai_assistance/presentation/widgets/title_line.dart';
import 'package:provider/provider.dart';

import 'child/home_childs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<RedeemCodeProvider>(context, listen: false).getRedeemCodes();
      Provider.of<NewsUpdateProvider>(context, listen: false).getNewsUpdates();
      Provider.of<EventProvider>(context, listen: false).getEvents();
      Provider.of<CharacterBannerProvider>(context, listen: false)
          .getCharacterBanners();
      Provider.of<EquipmentBannerProvider>(context, listen: false)
          .getEquipmentBanners();
      Provider.of<ElfBannerProvider>(context, listen: false).getElfBanners();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const RedeemCode(),
            SizedBox(height: 32.h),
            const NewsUpdate(),
            SizedBox(height: 32.h),
            const CurrentEvent(),
            SizedBox(height: 32.h),
            const TitleLine(title: "Curent Banner"),
            SizedBox(height: 16.h),
            const CharacterBanner(),
            SizedBox(height: 32.h),
            const EquipmentBanner(),
            SizedBox(height: 32.h),
            const ElfBanner(),
          ],
        ),
      ),
    );
  }
}
