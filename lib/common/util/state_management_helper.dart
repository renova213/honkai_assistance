import 'package:flutter/material.dart';
import 'package:honkai_assistance/presentation/providers/about_game_provider.dart';
import 'package:honkai_assistance/presentation/providers/character_banner_provider.dart';
import 'package:honkai_assistance/presentation/providers/character_provider.dart';
import 'package:honkai_assistance/presentation/providers/custom_sidebar_provider.dart';
import 'package:honkai_assistance/presentation/providers/database_provider.dart';
import 'package:honkai_assistance/presentation/providers/elf_banner_provider.dart';
import 'package:honkai_assistance/presentation/providers/equipment_banner_provider.dart';
import 'package:honkai_assistance/presentation/providers/event_provider.dart';
import 'package:honkai_assistance/presentation/providers/glossary_provider.dart';
import 'package:honkai_assistance/presentation/providers/news_update_provider.dart';
import 'package:honkai_assistance/presentation/providers/redeem_code_provider.dart';
import 'package:provider/provider.dart';

import '../../injection_container.dart';

class StateManagementHelper {
  static providers(Widget widget) {
    return MultiProvider(
      providers: [
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
        ChangeNotifierProvider(create: (_) => CustomSidebarProvider()),
        ChangeNotifierProvider(create: (_) => AboutGameProvider()),
        ChangeNotifierProvider(create: (_) => DatabaseProvider()),
        ChangeNotifierProvider<CharacterProvider>(
            create: (_) => sl<CharacterProvider>()),
        ChangeNotifierProvider(create: (_) => GlossaryProvider()),
      ],
      child: widget,
    );
  }
}
