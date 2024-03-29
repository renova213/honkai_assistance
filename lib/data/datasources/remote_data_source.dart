import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:honkai_assistance/data/models/character_banner_model.dart';
import 'package:honkai_assistance/data/models/character_model.dart';
import 'package:honkai_assistance/data/models/elf_banner_model.dart';
import 'package:honkai_assistance/data/models/elf_model.dart';
import 'package:honkai_assistance/data/models/equipment_banner_model.dart';
import 'package:honkai_assistance/data/models/event_model.dart';
import 'package:honkai_assistance/data/models/news_update_model.dart';
import 'package:honkai_assistance/data/models/outfit_model.dart';
import 'package:honkai_assistance/data/models/redeem_code_model.dart';
import 'package:honkai_assistance/data/models/stigmata_model.dart';

import '../models/changelog_model.dart';
import '../models/guide_model.dart';
import '../models/tier_list_model.dart';
import '../models/weapon_model.dart';

abstract class RemoteDataSource {
  Future<List<RedeemCodeModel>> getRedeemCode();
  Future<List<NewsUpdateModel>> getNewsUpdate();
  Future<List<EventModel>> getEvent();
  Future<List<CharacterBannerModel>> getCharacterBanner();
  Future<List<EquipmentBannerModel>> getEquipmentBanner();
  Future<List<ElfBannerModel>> getElfBanner();
  Future<List<CharacterModel>> getCharacter();
  Future<List<ElfModel>> getElf();
  Future<List<StigmataModel>> getStigmata();
  Future<List<WeaponModel>> getWeapon();
  Future<List<OutfitModel>> getOutfit();
  Future<List<TierListModel>> getTierList();
  Future<List<ChangelogModel>> getChangelog();
  Future<List<GuideModel>> getBeginnerGuide();
  Future<List<GuideModel>> getGeneralGuide();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseFirestore firestoreService;
  RemoteDataSourceImpl({required this.firestoreService});
  @override
  Future<List<RedeemCodeModel>> getRedeemCode() async {
    List<RedeemCodeModel> redeemCodes = [];
    await firestoreService.collection('redeem_code').get().then(
      (value) {
        for (var i in value.docs) {
          redeemCodes.add(RedeemCodeModel.fromMap(i.data()));
        }
      },
    );
    return redeemCodes;
  }

  @override
  Future<List<NewsUpdateModel>> getNewsUpdate() async {
    List<NewsUpdateModel> newsUpdates = [];
    await firestoreService.collection('news_update').get().then(
      (value) {
        for (var i in value.docs) {
          newsUpdates.add(NewsUpdateModel.fromMap(i.data()));
        }
      },
    );
    return newsUpdates;
  }

  @override
  Future<List<EventModel>> getEvent() async {
    List<EventModel> events = [];
    await firestoreService.collection('event').get().then(
      (value) {
        for (var i in value.docs) {
          events.add(EventModel.fromMap(i.data()));
        }
      },
    );
    return events;
  }

  @override
  Future<List<CharacterBannerModel>> getCharacterBanner() async {
    List<CharacterBannerModel> characterBanners = [];
    await firestoreService.collection('character_banner').get().then(
      (value) {
        for (var i in value.docs) {
          characterBanners.add(CharacterBannerModel.fromMap(i.data()));
        }
      },
    );
    return characterBanners;
  }

  @override
  Future<List<EquipmentBannerModel>> getEquipmentBanner() async {
    List<EquipmentBannerModel> equipmentBanners = [];
    await firestoreService.collection('equipment_banner').get().then(
      (value) {
        for (var i in value.docs) {
          equipmentBanners.add(EquipmentBannerModel.fromMap(i.data()));
        }
      },
    );
    return equipmentBanners;
  }

  @override
  Future<List<ElfBannerModel>> getElfBanner() async {
    List<ElfBannerModel> elfBanners = [];
    await firestoreService.collection('elf_banner').get().then(
      (value) {
        for (var i in value.docs) {
          elfBanners.add(ElfBannerModel.fromMap(i.data()));
        }
      },
    );
    return elfBanners;
  }

  @override
  Future<List<CharacterModel>> getCharacter() async {
    List<CharacterModel> characters = [];
    await firestoreService.collection('character').get().then(
      (value) {
        for (var i in value.docs) {
          characters.add(CharacterModel.fromMap(i.data()));
        }
      },
    );
    return characters;
  }

  @override
  Future<List<ElfModel>> getElf() async {
    List<ElfModel> elfs = [];
    await firestoreService.collection('elf').get().then(
      (value) {
        for (var i in value.docs) {
          elfs.add(ElfModel.fromMap(i.data()));
        }
      },
    );
    return elfs;
  }

  @override
  Future<List<StigmataModel>> getStigmata() async {
    List<StigmataModel> stigmatas = [];
    await firestoreService.collection('stigmata').get().then(
      (value) {
        for (var i in value.docs) {
          stigmatas.add(StigmataModel.fromMap(i.data()));
        }
      },
    );
    return stigmatas;
  }

  @override
  Future<List<WeaponModel>> getWeapon() async {
    List<WeaponModel> weapons = [];
    await firestoreService.collection('weapon').get().then(
      (value) {
        for (var i in value.docs) {
          weapons.add(WeaponModel.fromMap(i.data()));
        }
      },
    );
    return weapons;
  }

  @override
  Future<List<OutfitModel>> getOutfit() async {
    List<OutfitModel> outfits = [];
    await firestoreService.collection('outfit').get().then(
      (value) {
        for (var i in value.docs) {
          outfits.add(OutfitModel.fromMap(i.data()));
        }
      },
    );
    return outfits;
  }

  @override
  Future<List<TierListModel>> getTierList() async {
    List<TierListModel> tierList = [];
    await firestoreService.collection('tierList').get().then(
      (value) {
        for (var i in value.docs) {
          tierList.add(TierListModel.fromMap(i.data()));
        }
      },
    );
    return tierList;
  }

  @override
  Future<List<ChangelogModel>> getChangelog() async {
    List<ChangelogModel> changelogs = [];
    await firestoreService.collection('changelog').get().then(
      (value) {
        for (var i in value.docs) {
          changelogs.add(ChangelogModel.fromMap(i.data()));
        }
      },
    );
    return changelogs;
  }

  @override
  Future<List<GuideModel>> getBeginnerGuide() async {
    List<GuideModel> guides = [];
    await firestoreService.collection('beginner_guide').get().then(
      (value) {
        for (var i in value.docs) {
          guides.add(GuideModel.fromMap(i.data()));
        }
      },
    );
    return guides;
  }

  @override
  Future<List<GuideModel>> getGeneralGuide() async {
    List<GuideModel> guides = [];
    await firestoreService.collection('general_guide').get().then(
      (value) {
        for (var i in value.docs) {
          guides.add(GuideModel.fromMap(i.data()));
        }
      },
    );
    return guides;
  }
}
