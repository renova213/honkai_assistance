import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/presentation/blocs/home/banner_character_bloc/banner_character_bloc.dart';
import 'package:honkai_lab/presentation/blocs/home/elf_banner_bloc/elf_banner_bloc.dart';
import 'package:honkai_lab/presentation/blocs/home/event_honkai_bloc/event_honkai_bloc.dart';
import 'package:honkai_lab/presentation/blocs/home/update_bloc/update_bloc.dart';
import 'package:honkai_lab/presentation/blocs/home/weapon_stigmata_bloc/weapon_stigmata_bloc_bloc.dart';
import 'package:honkai_lab/presentation/widgets/home/current_banner_elf.dart';
import 'package:honkai_lab/presentation/widgets/home/current_banners_character.dart';
import 'package:honkai_lab/presentation/widgets/home/current_event.dart';
import 'package:honkai_lab/presentation/widgets/home/current_weapon_stigmata_banner.dart';
import 'package:honkai_lab/presentation/widgets/home/list_update.dart';
import 'package:honkai_lab/presentation/widgets/home/redeem_code.dart';

import '../../blocs/home/redeem_code_bloc/redeem_code_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<RedeemCodeBloc>(context, listen: false)
          .add(FetchActiveCode());
      BlocProvider.of<EventHonkaiBloc>(context, listen: false)
          .add(FetchEventHonkai());
      BlocProvider.of<UpdateBloc>(context, listen: false).add(FetchUpdate());
      BlocProvider.of<ElfBannerBloc>(context, listen: false)
          .add(FetchElfBanner());
      BlocProvider.of<BannerCharacterBloc>(context, listen: false)
          .add(FetchBannerCharacter());
      BlocProvider.of<WeaponStigmataBloc>(context, listen: false)
          .add(FetchWeaponStigmataBanner());
    });
  }

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
