import 'package:flutter/material.dart';
import 'package:honkai_assistance/presentation/provider/auth_provider.dart';
import 'package:honkai_assistance/presentation/provider/chat_provider.dart';
import 'package:honkai_assistance/presentation/provider/top_up_provider.dart';
import 'package:provider/provider.dart';

import '../../injection_container.dart';
import '../../presentation/provider/about_game_provider.dart';
import '../../presentation/provider/battlesuit_provider.dart';
import '../../presentation/provider/beginner_guide_provider.dart';
import '../../presentation/provider/changelog_provider.dart';
import '../../presentation/provider/character_banner_provider.dart';
import '../../presentation/provider/database_provider.dart';
import '../../presentation/provider/elf_banner_provider.dart';
import '../../presentation/provider/elf_provider.dart';
import '../../presentation/provider/equipment_banner_provider.dart';
import '../../presentation/provider/event_provider.dart';
import '../../presentation/provider/general_guide_provider.dart';
import '../../presentation/provider/glossary_provider.dart';
import '../../presentation/provider/navbar_provider.dart';
import '../../presentation/provider/news_update_provider.dart';
import '../../presentation/provider/outfit_provider.dart';
import '../../presentation/provider/redeem_code_provider.dart';
import '../../presentation/provider/stigmata_provider.dart';
import '../../presentation/provider/tier_list_provider.dart';
import '../../presentation/provider/weapon_provider.dart';

class StateManagementHelper {
  static providers(Widget widget) {
    return MultiProvider(
      providers: [
        //remote
        ChangeNotifierProvider<RedeemCodeProvider>(
            create: (_) => sl<RedeemCodeProvider>()),
        ChangeNotifierProvider<NewsUpdateProvider>(
            create: (_) => sl<NewsUpdateProvider>()),
        ChangeNotifierProvider<EventProvider>(
            create: (_) => sl<EventProvider>()),
        ChangeNotifierProvider<CharacterBannerProvider>(
            create: (_) => sl<CharacterBannerProvider>()),
        ChangeNotifierProvider<EquipmentBannerProvider>(
            create: (_) => sl<EquipmentBannerProvider>()),
        ChangeNotifierProvider<ElfBannerProvider>(
            create: (_) => sl<ElfBannerProvider>()),
        ChangeNotifierProvider<BattlesuitProvider>(
            create: (_) => sl<BattlesuitProvider>()),
        ChangeNotifierProvider<ElfProvider>(create: (_) => sl<ElfProvider>()),
        ChangeNotifierProvider<StigmataProvider>(
            create: (_) => sl<StigmataProvider>()),
        ChangeNotifierProvider<WeaponProvider>(
            create: (_) => sl<WeaponProvider>()),
        ChangeNotifierProvider<OutfitProvider>(
            create: (_) => sl<OutfitProvider>()),
        ChangeNotifierProvider<TierListProvider>(
            create: (_) => sl<TierListProvider>()),
        ChangeNotifierProvider<ChangelogProvider>(
            create: (_) => sl<ChangelogProvider>()),
        ChangeNotifierProvider<BeginnerGuideProvider>(
            create: (_) => sl<BeginnerGuideProvider>()),
        ChangeNotifierProvider<GeneralGuideProvider>(
            create: (_) => sl<GeneralGuideProvider>()),
        ChangeNotifierProvider<AuthProvider>(create: (_) => sl<AuthProvider>()),
        ChangeNotifierProvider<ChatProvider>(create: (_) => sl<ChatProvider>()),
        ChangeNotifierProvider<TopUpProvider>(
            create: (_) => sl<TopUpProvider>()),

        //raw
        ChangeNotifierProvider(create: (_) => AboutGameProvider()),
        ChangeNotifierProvider(create: (_) => DatabaseProvider()),
        ChangeNotifierProvider(create: (_) => GlossaryProvider()),
        ChangeNotifierProvider(create: (_) => NavbarProvider()),
      ],
      child: widget,
    );
  }
}
