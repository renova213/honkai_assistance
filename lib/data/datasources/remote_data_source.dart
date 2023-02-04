import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:honkai_assistance/data/models/character_banner_model.dart';
import 'package:honkai_assistance/data/models/character_model.dart';
import 'package:honkai_assistance/data/models/elf_banner_model.dart';
import 'package:honkai_assistance/data/models/elf_model.dart';
import 'package:honkai_assistance/data/models/equipment_banner_model.dart';
import 'package:honkai_assistance/data/models/event_model.dart';
import 'package:honkai_assistance/data/models/news_update_model.dart';
import 'package:honkai_assistance/data/models/redeem_code_model.dart';

abstract class RemoteDataSource {
  Future<List<RedeemCodeModel>> getRedeemCodes();
  Future<List<NewsUpdateModel>> getNewsUpdate();
  Future<List<EventModel>> getEvents();
  Future<List<CharacterBannerModel>> getCharacterBanners();
  Future<List<EquipmentBannerModel>> getEquipmentBanners();
  Future<List<ElfBannerModel>> getElfBanners();
  Future<List<CharacterModel>> getCharacters();
  Future<List<ElfModel>> getElfs();
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
}
