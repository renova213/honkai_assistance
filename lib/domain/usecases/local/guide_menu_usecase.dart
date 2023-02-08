import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/guide_menu_entity.dart';

class GuideMenuUsecase {
  Future<List<GuideMenuEntity>> beginnerGuide() async {
    const List<GuideMenuEntity> beginnerMenuGuides = [
      GuideMenuEntity(
          title: 'Beginner Guide',
          urlImage:
              'https://img-os-static.hoyolab.com/communityWeb/upload/1bd5c6ec07e6308c2fe2b966c0528b32.png',
          screen: SizedBox()),
      GuideMenuEntity(
          title: 'Reroll Guide',
          urlImage:
              'https://img-os-static.hoyolab.com/communityWeb/upload/dbceb72fe1fa24990a88cb4264e5f1b9.png',
          screen: SizedBox()),
      GuideMenuEntity(
          title: 'Starter Event',
          urlImage:
              'https://img-os-static.hoyolab.com/communityWeb/upload/212081fafb3806653d64feb933c2446d.png',
          screen: SizedBox())
    ];

    return beginnerMenuGuides;
  }

  Future<List<GuideMenuEntity>> generalGuide() async {
    const List<GuideMenuEntity> generalMenuGuides = [
      GuideMenuEntity(
          title: 'Dorm',
          urlImage:
              'https://img-os-static.hoyolab.com/communityWeb/upload/4b0390581cc64da5c19a453b6ff9b718.png',
          screen: SizedBox()),
      GuideMenuEntity(
          title: 'Armada',
          urlImage:
              'https://img-os-static.hoyolab.com/communityWeb/upload/be36d74d42252bfa8ad607786eb38ce4.png',
          screen: SizedBox()),
      GuideMenuEntity(
          title: 'Cadet-Sensei',
          urlImage:
              'https://img-os-static.hoyolab.com/communityWeb/upload/2dc195f8d7cb464ee8b9486af80790b1.png',
          screen: SizedBox())
    ];

    return generalMenuGuides;
  }
}
