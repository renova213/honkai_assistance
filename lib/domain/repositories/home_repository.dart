import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/domain/entities/character_banner_entity.dart';
import 'package:honkai_assistance/domain/entities/equipment_banner_entity.dart';
import 'package:honkai_assistance/domain/entities/event_entity.dart';
import 'package:honkai_assistance/domain/entities/news_update_entity.dart';

import '../../common/error/error.dart';
import '../entities/redeem_code_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<RedeemCodeEntity>>> getRedeemCodes();
  Future<Either<Failure, List<NewsUpdateEntity>>> getNewsUpdates();
  Future<Either<Failure, List<EventEntity>>> getEvents();
  Future<Either<Failure, List<CharacterBannerEntity>>> getCharacterBanner();
  Future<Either<Failure, List<EquipmentBannerEntity>>> getEquipmentBanner();
}
