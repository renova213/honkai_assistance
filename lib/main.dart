import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/presentation/blocs/character_bloc/character_bloc.dart';
import 'package:honkai_lab/presentation/blocs/home/banner_character_bloc/banner_character_bloc.dart';
import 'package:honkai_lab/presentation/blocs/home/elf_banner_bloc/elf_banner_bloc.dart';
import 'package:honkai_lab/presentation/blocs/home/event_honkai_bloc/event_honkai_bloc.dart';
import 'package:honkai_lab/presentation/blocs/home/redeem_code_bloc/redeem_code_bloc.dart';
import 'package:honkai_lab/presentation/blocs/home/update_bloc/update_bloc.dart';
import 'package:honkai_lab/presentation/blocs/home/weapon_stigmata_bloc/weapon_stigmata_bloc_bloc.dart';
import 'package:honkai_lab/presentation/blocs/tier_list/changelog_bloc/changelog_bloc.dart';
import 'package:honkai_lab/presentation/pages/splash/spash_screen.dart';
import 'package:honkai_lab/presentation/providers/about_provider.dart';
import 'package:honkai_lab/presentation/providers/character_provider.dart';
import 'package:honkai_lab/presentation/providers/detail_character_provider.dart';
import 'package:honkai_lab/presentation/providers/header_provider.dart';
import 'package:honkai_lab/presentation/providers/home_provider.dart';
import 'package:honkai_lab/presentation/providers/tier_list_provider.dart';
import 'package:provider/provider.dart';

import 'injector_container.dart';
import 'presentation/blocs/tier_list/tier_list_character_bloc/tier_list_character_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HeaderProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AboutProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TierListProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CharacterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailCharacterProvider(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RedeemCodeBloc>(
            create: (_) => sl<RedeemCodeBloc>(),
          ),
          BlocProvider<EventHonkaiBloc>(
            create: (_) => sl<EventHonkaiBloc>(),
          ),
          BlocProvider<UpdateBloc>(
            create: (_) => sl<UpdateBloc>(),
          ),
          BlocProvider<ElfBannerBloc>(
            create: (_) => sl<ElfBannerBloc>(),
          ),
          BlocProvider<BannerCharacterBloc>(
            create: (_) => sl<BannerCharacterBloc>(),
          ),
          BlocProvider<WeaponStigmataBloc>(
            create: (_) => sl<WeaponStigmataBloc>(),
          ),
          BlocProvider<CharacterBloc>(
            create: (_) => sl<CharacterBloc>(),
          ),
          BlocProvider<TierListCharacterBloc>(
            create: (_) => sl<TierListCharacterBloc>(),
          ),
          BlocProvider<ChangelogBloc>(
            create: (_) => sl<ChangelogBloc>(),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
