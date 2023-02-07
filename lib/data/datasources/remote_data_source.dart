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
import '../models/tier_list_model.dart';
import '../models/weapon_model.dart';

abstract class RemoteDataSource {
  Future<List<RedeemCodeModel>> getRedeemCodes();
  Future<List<NewsUpdateModel>> getNewsUpdate();
  Future<List<EventModel>> getEvents();
  Future<List<CharacterBannerModel>> getCharacterBanners();
  Future<List<EquipmentBannerModel>> getEquipmentBanners();
  Future<List<ElfBannerModel>> getElfBanners();
  Future<List<CharacterModel>> getCharacters();
  Future<List<ElfModel>> getElfs();
  Future<List<StigmataModel>> getStigmata();
  Future<List<WeaponModel>> getWeapons();
  Future<List<OutfitModel>> getOutfits();
  Future<List<TierListModel>> getTierList();
  Future<List<ChangelogModel>> getChangelog();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseFirestore firestoreService;
  RemoteDataSourceImpl({required this.firestoreService});
  @override
  Future<List<RedeemCodeModel>> getRedeemCodes() async {
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
  Future<List<EventModel>> getEvents() async {
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
  Future<List<CharacterBannerModel>> getCharacterBanners() async {
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
  Future<List<EquipmentBannerModel>> getEquipmentBanners() async {
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
  Future<List<ElfBannerModel>> getElfBanners() async {
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
  Future<List<CharacterModel>> getCharacters() async {
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
  Future<List<ElfModel>> getElfs() async {
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
  Future<List<WeaponModel>> getWeapons() async {
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
  Future<List<OutfitModel>> getOutfits() async {
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
}
