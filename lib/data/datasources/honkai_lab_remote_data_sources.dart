import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:honkai_lab/data/models/banner_character_model.dart';
import 'package:honkai_lab/data/models/character_model.dart';
import 'package:honkai_lab/data/models/elf_banner_model.dart';
import 'package:honkai_lab/data/models/event_honkai_model.dart';
import 'package:honkai_lab/data/models/latest_update_model.dart';
import 'package:honkai_lab/data/models/weapon_stigma_banner_model.dart';

import '../models/activecode_model.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

abstract class HonkaiLabRemoteDataSource {
  Future<List<ActiveCodeModel>> getActiveCodes(String collectionName);
  Future<List<EventHonkaiModel>> getEventHonkai(String collectionName);
  Future<List<LatestUpdateModel>> getLastUpdate(String collectionName);
  Future<List<BannerCharacterModel>> getBannerCharacter(String collectionName);
  Future<List<ElfBannerModel>> getElfBanner(String collectionName);
  Future<List<WeaponStigmaBannerModel>> getWeaponStigmaBanner(
      String collectionName);

  Future<List<CharacterModel>> getCharacter(String collectionName);
}

class HonkaiLabRemoteDataSourceImpl implements HonkaiLabRemoteDataSource {
  @override
  Future<List<ActiveCodeModel>> getActiveCodes(String collectionName) async {
    List<ActiveCodeModel> activeCodes = [];

    await db.collection(collectionName).get().then(
      (value) {
        for (var i in value.docs) {
          activeCodes.add(
            ActiveCodeModel.fromMap(
              i.data(),
            ),
          );
        }
      },
    );
    return activeCodes;
  }

  @override
  Future<List<EventHonkaiModel>> getEventHonkai(String collectionName) async {
    List<EventHonkaiModel> listEvent = [];

    await db.collection(collectionName).get().then(
      (value) {
        for (var i in value.docs) {
          listEvent.add(
            EventHonkaiModel.fromMap(
              i.data(),
            ),
          );
        }
      },
    );
    return listEvent;
  }

  @override
  Future<List<LatestUpdateModel>> getLastUpdate(String collectionName) async {
    List<LatestUpdateModel> listLastUpdate = [];

    await db.collection(collectionName).get().then(
      (value) {
        for (var i in value.docs) {
          listLastUpdate.add(
            LatestUpdateModel.fromMap(
              i.data(),
            ),
          );
        }
      },
    );
    return listLastUpdate;
  }

  @override
  Future<List<BannerCharacterModel>> getBannerCharacter(
      String collectionName) async {
    List<BannerCharacterModel> listBannercharacter = [];

    await db.collection(collectionName).get().then(
      (value) {
        for (var i in value.docs) {
          listBannercharacter.add(
            BannerCharacterModel.fromMap(
              i.data(),
            ),
          );
        }
      },
    );
    return listBannercharacter;
  }

  @override
  Future<List<ElfBannerModel>> getElfBanner(String collectionName) async {
    List<ElfBannerModel> listElfBanner = [];

    await db.collection(collectionName).get().then(
      (value) {
        for (var i in value.docs) {
          listElfBanner.add(
            ElfBannerModel.fromMap(
              i.data(),
            ),
          );
        }
      },
    );
    return listElfBanner;
  }

  @override
  Future<List<WeaponStigmaBannerModel>> getWeaponStigmaBanner(
      String collectionName) async {
    List<WeaponStigmaBannerModel> listWeaponStigmaBanner = [];

    await db.collection(collectionName).get().then(
      (value) {
        for (var i in value.docs) {
          listWeaponStigmaBanner.add(
            WeaponStigmaBannerModel.fromMap(
              i.data(),
            ),
          );
        }
      },
    );
    return listWeaponStigmaBanner;
  }

  @override
  Future<List<CharacterModel>> getCharacter(String collectionName) async {
    List<CharacterModel> characters = [];

    await db.collection(collectionName).get().then(
      (value) {
        for (var i in value.docs) {
          characters.add(
            CharacterModel.fromMap(
              i.data(),
            ),
          );
        }
      },
    );
    return characters;
  }
}
