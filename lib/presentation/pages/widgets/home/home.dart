import 'package:flutter/material.dart';
import 'package:honkai_lab/presentation/pages/widgets/home/current_banner_elf.dart';
import 'package:honkai_lab/presentation/pages/widgets/home/current_banners_character.dart';
import 'package:honkai_lab/presentation/pages/widgets/home/current_event.dart';
import 'package:honkai_lab/presentation/pages/widgets/home/current_weapon_stigmata_banner.dart';
import 'package:honkai_lab/presentation/pages/widgets/home/list_update.dart';
import 'package:honkai_lab/presentation/pages/widgets/home/redeem_code.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(width * 0.05),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          RedeemCode(),
          SizedBox(height: 32),
          ListUpdate(),
          SizedBox(height: 32),
          CurrentEvent(),
          SizedBox(height: 32),
          CurrentBannerCharacter(),
          SizedBox(height: 32),
          CurrentWeaponStigmataBanner(),
          SizedBox(height: 32),
          CurrentBannerElf(),
        ],
      ),
    );
  }
}
