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
import '../entities/guide_entity.dart';
import '../entities/redeem_code_entity.dart';
import '../entities/tier_list_entity.dart';

abstract class RemoteRepository {
  Future<Either<Failure, List<RedeemCodeEntity>>> getRedeemCode();
  Future<Either<Failure, List<NewsUpdateEntity>>> getNewsUpdate();
  Future<Either<Failure, List<EventEntity>>> getEvent();
  Future<Either<Failure, List<CharacterBannerEntity>>> getCharacterBanner();
  Future<Either<Failure, List<EquipmentBannerEntity>>> getEquipmentBanner();
  Future<Either<Failure, List<ElfBannerEntity>>> getElfBanner();
  Future<Either<Failure, List<CharacterEntity>>> getCharacter();
  Future<Either<Failure, List<ElfEntity>>> getElf();
  Future<Either<Failure, List<StigmataEntity>>> getStigmata();
  Future<Either<Failure, List<WeaponEntity>>> getWeapon();
  Future<Either<Failure, List<OutfitEntity>>> getOutfit();
  Future<Either<Failure, List<TierListEntity>>> getTierList();
  Future<Either<Failure, List<ChangelogEntity>>> getChangelog();
  Future<Either<Failure, List<GuideEntity>>> getBeginnerGuide();
  Future<Either<Failure, List<GuideEntity>>> getGeneralGuide();
}
