import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/domain/entities/character_banner_entity.dart';
import 'package:honkai_assistance/domain/entities/elf_entity.dart';
import 'package:honkai_assistance/domain/entities/equipment_banner_entity.dart';
import 'package:honkai_assistance/domain/entities/event_entity.dart';
import 'package:honkai_assistance/domain/entities/news_update_entity.dart';
import 'package:honkai_assistance/domain/entities/outfit_entity.dart';
import 'package:honkai_assistance/domain/entities/stigmata_entity.dart';
import 'package:honkai_assistance/domain/entities/weapon_entity.dart';

import '../../common/error/error.dart';
import '../entities/changelog_entity.dart';
import '../entities/character_entity.dart';
import '../entities/elf_banner_entity.dart';
import '../entities/redeem_code_entity.dart';
import '../entities/tier_list_entity.dart';

abstract class RemoteRepository {
  Future<Either<Failure, List<RedeemCodeEntity>>> getRedeemCodes();
  Future<Either<Failure, List<NewsUpdateEntity>>> getNewsUpdates();
  Future<Either<Failure, List<EventEntity>>> getEvents();
  Future<Either<Failure, List<CharacterBannerEntity>>> getCharacterBanners();
  Future<Either<Failure, List<EquipmentBannerEntity>>> getEquipmentBanners();
  Future<Either<Failure, List<ElfBannerEntity>>> getElfBanners();
  Future<Either<Failure, List<CharacterEntity>>> getCharacters();
  Future<Either<Failure, List<ElfEntity>>> getElfs();
  Future<Either<Failure, List<StigmataEntity>>> getStigmatas();
  Future<Either<Failure, List<WeaponEntity>>> getWeapons();
  Future<Either<Failure, List<OutfitEntity>>> getOutfits();
  Future<Either<Failure, List<TierListEntity>>> getTierList();
  Future<Either<Failure, List<ChangelogEntity>>> getChangelogs();
}
