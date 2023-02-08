import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/util/navigator_fade_helper.dart';
import 'package:honkai_assistance/presentation/provider/local/guide_provider.dart';
import 'package:honkai_assistance/presentation/screens/menu_screen.dart';
import 'package:provider/provider.dart';

import '../../common/style/style.dart';
import '../provider/firestore/battlesuit_provider.dart';
import '../provider/firestore/character_banner_provider.dart';
import '../provider/firestore/elf_banner_provider.dart';
import '../provider/firestore/elf_provider.dart';
import '../provider/firestore/equipment_banner_provider.dart';
import '../provider/firestore/event_provider.dart';
import '../provider/firestore/news_update_provider.dart';
import '../provider/firestore/outfit_provider.dart';
import '../provider/firestore/redeem_code_provider.dart';
import '../provider/firestore/stigmata_provider.dart';
import '../provider/firestore/tier_list_provider.dart';
import '../provider/firestore/weapon_provider.dart';
import '../provider/local/about_game_provider.dart';
import '../provider/local/database_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AssetImage? assetImage;
  startTime() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        NavigatorFadeHelper(
          child: const MenuScreen(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    assetImage = const AssetImage('assets/images/crystal.png');
    Future.microtask(() {
      //remote
      Provider.of<RedeemCodeProvider>(context, listen: false).getRedeemCodes();
      Provider.of<NewsUpdateProvider>(context, listen: false).getNewsUpdates();
      Provider.of<EventProvider>(context, listen: false).getEvents();
      Provider.of<CharacterBannerProvider>(context, listen: false)
          .getCharacterBanners();
      Provider.of<EquipmentBannerProvider>(context, listen: false)
          .getEquipmentBanners();
      Provider.of<ElfBannerProvider>(context, listen: false).getElfBanners();
      Provider.of<BattlesuitProvider>(context, listen: false).getBattlesuits();
      Provider.of<ElfProvider>(context, listen: false).getElfs();
      Provider.of<OutfitProvider>(context, listen: false).getOutfits();
      Provider.of<StigmataProvider>(context, listen: false).getStigmatas();
      Provider.of<TierListProvider>(context, listen: false).getTierLists();
      Provider.of<WeaponProvider>(context, listen: false).getWeapons();

      //local
      Provider.of<AboutGameProvider>(context, listen: false).getAboutContent();
      Provider.of<AboutGameProvider>(context, listen: false)
          .getOfficialLinkGlobal();
      Provider.of<AboutGameProvider>(context, listen: false)
          .getOfficialLinkSea();
      Future.microtask(() =>
          Provider.of<DatabaseProvider>(context, listen: false)
              .getMenuDatabase());
      Provider.of<GuideProvider>(context, listen: false).getBeginnerMenuGuide();
      Provider.of<GuideProvider>(context, listen: false).getGeneralMenuGuide();
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
