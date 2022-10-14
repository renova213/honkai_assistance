import 'package:dartz/dartz.dart';
import 'package:honkai_lab/common/errors/failure.dart';
import 'package:honkai_lab/domain/entities/active_code.dart';
import 'package:honkai_lab/domain/entities/banner_character.dart';
import 'package:honkai_lab/domain/entities/elf_banner.dart';
import 'package:honkai_lab/domain/entities/event_honkai.dart';
import 'package:honkai_lab/domain/entities/last_update.dart';
import 'package:honkai_lab/domain/entities/weapon_stigmata_banner.dart';

abstract class HonkaiLabRepositories {
  Future<Either<Failure, List<ActiveCode>>> getActiveCodes(
      String collectionName);
  Future<Either<Failure, List<EventHonkai>>> getEventHonkai(
      String collectionName);
  Future<Either<Failure, List<LatestUpdate>>> getLatestUpdate(
      String collectionName);
  Future<Either<Failure, List<BannerCharacter>>> getBannerCharacter(
      String collectionName);
  Future<Either<Failure, List<ElfBanner>>> getElfBanner(String collectionName);
  Future<Either<Failure, List<WeaponStigmataBanner>>> getWeaponStigmaBanner(
      String collectionName);
}