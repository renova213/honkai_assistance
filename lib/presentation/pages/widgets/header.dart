import 'package:flutter/material.dart';
import 'package:honkai_lab/presentation/providers/header_provider.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.black87,
      height: 60,
      width: width,
      child: Row(
        children: [
          const SizedBox(width: 16),
          Image.asset('assets/crystal.png', width: 40, height: 40),
          const Text(
            "Honkai Lab",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Spacer(),
          Consumer<HeaderProvider>(
            builder: (context, header, _) => IconButton(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, anim) => RotationTransition(
                  turns: child.key == const ValueKey('icon1')
                      ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                      : Tween<double>(begin: 0.75, end: 1).animate(anim),
                  child: ScaleTransition(scale: anim, child: child),
                ),
                child: header.currentIndex == 0
                    ? const Icon(
                        Icons.menu,
                        color: Colors.white,
                        key: ValueKey('icon1'),
                      )
                    : const Icon(
                        Icons.close,
                        color: Colors.white,
                        key: ValueKey('icon2'),
                      ),
              ),
              onPressed: () {
                header.currentIndex == 0 ? header.index(1) : header.index(0);
                header.isExpand == false
                    ? header.isExpanded(true)
                    : header.isExpanded(false);
              },
            ),
          )
        ],
      ),
    );
  }
}
