import 'package:flutter/material.dart';
import 'package:honkai_assistance/presentation/provider/button/about_game_button_provider.dart';
import 'package:honkai_assistance/presentation/provider/button/redeem_code_button_provider.dart';
import 'package:honkai_assistance/presentation/provider/button/sidebar_button_provider.dart';
import 'package:honkai_assistance/presentation/provider/firestore/battlesuit/battlesuit_provider.dart';

import 'package:provider/provider.dart';

import '../../injection_container.dart';
import '../../presentation/provider/firestore/character_banner_provider.dart';
import '../../presentation/provider/firestore/elf_banner_provider.dart';
import '../../presentation/provider/firestore/equipment_banner_provider.dart';
import '../../presentation/provider/firestore/event_provider.dart';
import '../../presentation/provider/firestore/news_update_provider.dart';
import '../../presentation/provider/firestore/redeem_code_provider.dart';
import '../../presentation/provider/local/about_game_provider.dart';
import '../../presentation/provider/local/sidebar_provider.dart';
import '../../presentation/provider/local/database_provider.dart';
import '../../presentation/provider/local/glossary_provider.dart';

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

        //local
        ChangeNotifierProvider(
          create: (_) => SidebarProvider(sidebarMenu: sl()),
        ),
        ChangeNotifierProvider(
          create: (_) => AboutGameProvider(
              aboutContentUsecase: sl(),
              officialLinkSeaUsecase: sl(),
              officialLinkGlobalUsecase: sl()),
        ),
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(menuDatabaseUsecase: sl()),
        ),
        ChangeNotifierProvider(
          create: (_) => GlossaryProvider(
              gameMode: sl(), glossaryRank: sl(), glossarySpeciality: sl()),
        ),

        //button
        ChangeNotifierProvider(create: (_) => AboutGameButtonProvider()),
        ChangeNotifierProvider(create: (_) => SidebarButtonProvider()),
        ChangeNotifierProvider(create: (_) => RedeemCodeButtonProvider()),
      ],
      child: widget,
    );
  }
}
