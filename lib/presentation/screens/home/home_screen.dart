import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/blocs/character_banner/character_banner_bloc.dart';
import 'package:honkai_assistance/presentation/blocs/elf_banner/elf_banner_bloc.dart';
import 'package:honkai_assistance/presentation/blocs/equipment_banner/equipment_banner_bloc.dart';
import 'package:honkai_assistance/presentation/blocs/event/event_bloc.dart';
import 'package:honkai_assistance/presentation/blocs/news_update/news_update_bloc.dart';
import 'package:honkai_assistance/presentation/screens/home/child/character_banner.dart';
import 'package:honkai_assistance/presentation/screens/home/child/current_event.dart';
import 'package:honkai_assistance/presentation/screens/home/child/elf_banner.dart';
import 'package:honkai_assistance/presentation/screens/home/child/news_update.dart';
import 'package:honkai_assistance/presentation/screens/home/child/redeem_code.dart';
import 'package:honkai_assistance/presentation/widgets/title_line.dart';

import '../../blocs/redeem_code/redeem_code_bloc.dart';
import 'child/equipment_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<RedeemCodeBloc>(context).add(GetRedeemCodeEvent());
      BlocProvider.of<NewsUpdateBloc>(context).add(GetNewsUpdateEvent());
      BlocProvider.of<EventBloc>(context).add(GetEventEvent());
      BlocProvider.of<CharacterBannerBloc>(context)
          .add(GetCharacterBannerEvent());
      BlocProvider.of<EquipmentBannerBloc>(context)
          .add(GetEquipmentBannerEvent());
      BlocProvider.of<ElfBannerBloc>(context).add(GetElfBannerEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const RedeemCode(),
            SizedBox(height: 32.h),
            const NewsUpdate(),
            SizedBox(height: 32.h),
            const CurrentEvent(),
            SizedBox(height: 32.h),
            const TitleLine(title: "Curent Banner"),
            SizedBox(height: 16.h),
            const CharacterBanner(),
            SizedBox(height: 32.h),
            const EquipmentBanner(),
            SizedBox(height: 32.h),
            const ElfBanner(),
          ],
        ),
      ),
    );
  }
}
