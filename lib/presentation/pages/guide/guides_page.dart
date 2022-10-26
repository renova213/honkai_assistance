import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/common/navigator_fade_transition.dart';
import 'package:honkai_lab/presentation/pages/guide/beginner/reroll_guide.dart';
import 'package:honkai_lab/presentation/pages/guide/beginner/starter_event_guide.dart';
import 'package:honkai_lab/presentation/pages/guide/general/armada_page.dart';
import 'package:honkai_lab/presentation/pages/guide/general/cadet_sensei_page.dart';
import 'package:honkai_lab/presentation/pages/guide/general/dorm_page.dart';

import '../../../common/style.dart';
import 'beginner/beginner_guide_page.dart';

class GuidesPage extends StatelessWidget {
  const GuidesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Text("Guides", style: headline6),
              const SizedBox(height: 8),
              Text("Our guides will help you become a better player",
                  style: bodyText1),
              const SizedBox(height: 16),
              _titleContainer("Beginner"),
              const SizedBox(height: 16),
              _menuItemContainer(
                width: width,
                title: "Beginner Guide",
                urlImage:
                    "https://img-os-static.hoyolab.com/communityWeb/upload/1bd5c6ec07e6308c2fe2b966c0528b32.png",
                context: context,
                page: const BeginnerGuidePage(),
              ),
              const SizedBox(height: 8),
              _menuItemContainer(
                width: width,
                title: "Reroll Guide",
                urlImage:
                    "https://img-os-static.hoyolab.com/communityWeb/upload/dbceb72fe1fa24990a88cb4264e5f1b9.png",
                context: context,
                page: const RerollGuidePage(),
              ),
              const SizedBox(height: 8),
              _menuItemContainer(
                width: width,
                title: "Starter Event",
                urlImage:
                    "https://img-os-static.hoyolab.com/communityWeb/upload/212081fafb3806653d64feb933c2446d.png",
                context: context,
                page: const StarterEventPage(),
              ),
              const SizedBox(height: 16),
              _titleContainer("General"),
              const SizedBox(height: 16),
              _menuItemContainer(
                width: width,
                title: "Dorm",
                urlImage:
                    "https://img-os-static.hoyolab.com/communityWeb/upload/4b0390581cc64da5c19a453b6ff9b718.png",
                context: context,
                page: const DormPage(),
              ),
              const SizedBox(height: 16),
              _menuItemContainer(
                width: width,
                title: "Armada",
                urlImage:
                    "https://img-os-static.hoyolab.com/communityWeb/upload/be36d74d42252bfa8ad607786eb38ce4.png",
                context: context,
                page: const ArmadaPage(),
              ),
              const SizedBox(height: 16),
              _menuItemContainer(
                width: width,
                title: "Cadet-Sensei",
                urlImage:
                    "https://img-os-static.hoyolab.com/communityWeb/upload/2dc195f8d7cb464ee8b9486af80790b1.png",
                context: context,
                page: const CadetSenseiPage(),
              ),
              SizedBox(height: height * 0.1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleContainer(String title) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(color: Colors.blue, width: 3),
            ),
          ),
          child: Text(title, style: subtitle),
        ),
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade700, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _menuItemContainer(
      {required double width,
      required String title,
      required String urlImage,
      required BuildContext context,
      required Widget page}) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        NavigatorFadeTransition(child: page),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          border: Border.all(color: Colors.grey.shade600),
          borderRadius: BorderRadius.circular(5),
        ),
        height: 55,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 45,
                width: 45,
                child: CachedNetworkImage(
                  imageUrl: urlImage,
                  errorWidget: (context, url, error) {
                    return const Center(
                      child: Icon(Icons.error, color: Colors.red),
                    );
                  },
                  placeholder: (context, url) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: subtitle),
                    const Icon(Icons.keyboard_double_arrow_right,
                        size: 20, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
