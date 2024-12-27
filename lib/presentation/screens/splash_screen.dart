import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../common/style/style.dart';
import '../../common/util/utils.dart';
import '../provider/battlesuit_provider.dart';
import '../provider/beginner_guide_provider.dart';
import '../provider/character_banner_provider.dart';
import '../provider/elf_banner_provider.dart';
import '../provider/elf_provider.dart';
import '../provider/equipment_banner_provider.dart';
import '../provider/event_provider.dart';
import '../provider/general_guide_provider.dart';
import '../provider/news_update_provider.dart';
import '../provider/outfit_provider.dart';
import '../provider/redeem_code_provider.dart';
import '../provider/stigmata_provider.dart';
import '../provider/tier_list_provider.dart';
import '../provider/weapon_provider.dart';
import 'navbar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AssetImage? assetImage;
  startTime() async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          NavigatorFadeHelper(
            child: const NavbarScreen(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    assetImage = const AssetImage('assets/images/crystal.png');
    Future.microtask(() {
      if (mounted) {
        //remote
        Provider.of<RedeemCodeProvider>(context, listen: false)
            .getRedeemCodes();
        Provider.of<NewsUpdateProvider>(context, listen: false)
            .getNewsUpdates();
        Provider.of<EventProvider>(context, listen: false).getEvents();
        Provider.of<CharacterBannerProvider>(context, listen: false)
            .getCharacterBanners();
        Provider.of<EquipmentBannerProvider>(context, listen: false)
            .getEquipmentBanners();
        Provider.of<ElfBannerProvider>(context, listen: false).getElfBanners();
        Provider.of<BattlesuitProvider>(context, listen: false)
            .getBattlesuits();
        Provider.of<ElfProvider>(context, listen: false).getElfs();
        Provider.of<OutfitProvider>(context, listen: false).getOutfits();
        Provider.of<StigmataProvider>(context, listen: false).getStigmatas();
        Provider.of<TierListProvider>(context, listen: false).getTierLists();
        Provider.of<WeaponProvider>(context, listen: false).getWeapons();
        Provider.of<BeginnerGuideProvider>(context, listen: false)
            .getBeginnerGuides();
        Provider.of<GeneralGuideProvider>(context, listen: false)
            .getGeneralGuides();
      }
    });
    startTime();
  }

  @override
  void didChangeDependencies() {
    precacheImage(assetImage!, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: AppColor.primaryColor),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: assetImage!,
                          ),
                        ),
                      ),
                      Text("HonkaiAssistance", style: AppFont.headline6),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text("Honkai Impact 3 Guide & Tier List",
                      style: AppFont.smallText),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
