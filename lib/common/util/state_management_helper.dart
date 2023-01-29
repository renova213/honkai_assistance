import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_assistance/presentation/blocs/character_banner/character_banner_bloc.dart';
import 'package:honkai_assistance/presentation/blocs/elf_banner/elf_banner_bloc.dart';
import 'package:honkai_assistance/presentation/blocs/equipment_banner/equipment_banner_bloc.dart';
import 'package:honkai_assistance/presentation/blocs/event/event_bloc.dart';
import 'package:honkai_assistance/presentation/blocs/news_update/news_update_bloc.dart';
import 'package:honkai_assistance/presentation/providers/about_game_provider.dart';
import 'package:honkai_assistance/presentation/providers/custom_sidebar_provider.dart';
import 'package:honkai_assistance/presentation/providers/database_provider.dart';
import 'package:honkai_assistance/presentation/providers/redeem_code_provider.dart';
import 'package:provider/provider.dart';

import '../../injection_container.dart';
import '../../presentation/blocs/redeem_code/redeem_code_bloc.dart';

class StateManagementHelper {
  static providers(Widget widget) {
    return MultiProvider(
      providers: [
        //bloc
        BlocProvider<RedeemCodeBloc>(create: (_) => sl<RedeemCodeBloc>()),
        BlocProvider<NewsUpdateBloc>(create: (_) => sl<NewsUpdateBloc>()),
        BlocProvider<EventBloc>(create: (_) => sl<EventBloc>()),
        BlocProvider<CharacterBannerBloc>(
            create: (_) => sl<CharacterBannerBloc>()),
        BlocProvider<EquipmentBannerBloc>(
            create: (_) => sl<EquipmentBannerBloc>()),
        BlocProvider<ElfBannerBloc>(create: (_) => sl<ElfBannerBloc>()),

        //provider
        ChangeNotifierProvider(create: (_) => CustomSidebarProvider()),
        ChangeNotifierProvider(create: (_) => RedeemCodeProvider()),
        ChangeNotifierProvider(create: (_) => AboutGameProvider()),
        ChangeNotifierProvider(create: (_) => DatabaseProvider()),
      ],
      child: widget,
    );
  }
}
