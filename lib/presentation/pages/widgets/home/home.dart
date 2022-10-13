import 'package:flutter/material.dart';
import 'package:honkai_lab/presentation/pages/widgets/home/current_banners_character.dart';
import 'package:honkai_lab/presentation/pages/widgets/home/current_event.dart';
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
        children: [
          _searchCharacter(),
          const SizedBox(height: 32),
          const RedeemCode(),
          const SizedBox(height: 32),
          const ListUpdate(),
          const SizedBox(height: 32),
          const CurrentEvent(),
          const SizedBox(height: 32),
          const CurrentBannerCharacter(),
        ],
      ),
    );
  }

  Widget _searchCharacter() {
    return SizedBox(
      child: TextField(
        decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey.shade700),
            hintText: "Search Character ...",
            filled: true,
            fillColor: Colors.white),
      ),
    );
  }
}
