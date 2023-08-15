import 'package:flutter/material.dart';
import 'package:honkai_assistance/common/style/style.dart';
import 'package:honkai_assistance/presentation/provider/navbar_provider.dart';
import 'package:provider/provider.dart';

class TopUpNavBar extends StatefulWidget {
  const TopUpNavBar({super.key});

  @override
  State<TopUpNavBar> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<TopUpNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Consumer<NavbarProvider>(
        builder: (context, navbar, _) => Center(
          child: navbar.topUpPages[navbar.topUpCurrentIndex],
        ),
      ),
      bottomNavigationBar: Consumer<NavbarProvider>(
        builder: (context, navbar, _) => BottomNavigationBar(
          backgroundColor: AppColor.secondaryColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.history_edu),
              icon: Icon(Icons.history_edu_outlined),
              label: 'Track Order',
            ),
          ],
          selectedLabelStyle: AppFont.mediumText,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          unselectedLabelStyle:
              AppFont.smallText.copyWith(color: Colors.white.withOpacity(0.7)),
          iconSize: 28,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          currentIndex: navbar.topUpCurrentIndex,
          selectedItemColor: Colors.white,
          onTap: (index) {
            navbar.changeTopUpIndex(index);
          },
        ),
      ),
    );
  }
}
