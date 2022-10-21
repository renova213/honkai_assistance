import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/presentation/pages/splash/spash_screen.dart';
import 'package:honkai_lab/presentation/providers/about_provider.dart';
import 'package:honkai_lab/presentation/providers/character_provider.dart';
import 'package:honkai_lab/presentation/providers/detail_character_provider.dart';
import 'package:honkai_lab/presentation/providers/header_provider.dart';
import 'package:honkai_lab/presentation/providers/home_provider.dart';
import 'package:honkai_lab/presentation/providers/tier_list_provider.dart';
import 'package:provider/provider.dart';

import 'injector_container.dart';

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
          create: (_) => sl<HomeProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => AboutProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TierListProvider(
            character: sl(),
            changelog: sl(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => CharacterProvider(
            character: sl(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailCharacterProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
