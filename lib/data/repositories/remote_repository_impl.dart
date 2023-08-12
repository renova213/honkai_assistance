import 'dart:io';

import 'package:honkai_assistance/data/models/chat_model.dart';
import 'package:honkai_assistance/domain/entities/changelog_entity.dart';
import 'package:honkai_assistance/domain/entities/character_banner_entity.dart';
import 'package:honkai_assistance/domain/entities/elf_banner_entity.dart';
import 'package:honkai_assistance/domain/entities/elf_entity.dart';
import 'package:honkai_assistance/domain/entities/equipment_banner_entity.dart';
import 'package:honkai_assistance/domain/entities/event_entity.dart';
import 'package:honkai_assistance/domain/entities/guide_entity.dart';
import 'package:honkai_assistance/domain/entities/news_update_entity.dart';
import 'package:honkai_assistance/domain/entities/outfit_entity.dart';
import 'package:honkai_assistance/domain/entities/redeem_code_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/domain/entities/stigmata_entity.dart';
import 'package:honkai_assistance/domain/entities/tier_list_entity.dart';
import 'package:honkai_assistance/domain/entities/weapon_entity.dart';

import '../../common/constant.dart';
import '../../common/error/error.dart';
import '../../domain/entities/character_entity.dart';
import '../../domain/repositories/remote_repository.dart';
import '../datasources/remote_data_source.dart';

class RemoteRepositoryImpl implements RemoteRepository {
  final RemoteDataSource remoteDataSource;
  RemoteRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<RedeemCodeEntity>>> getRedeemCode() async {
    try {
      final redeemCodes = await remoteDataSource.getRedeemCode();

      return Right(redeemCodes);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<NewsUpdateEntity>>> getNewsUpdate() async {
    try {
      final newsUpdates = await remoteDataSource.getNewsUpdate();

      return Right(newsUpdates);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getEvent() async {
    try {
      final events = await remoteDataSource.getEvent();

      return Right(events);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<CharacterBannerEntity>>>
      getCharacterBanner() async {
    try {
      final characterBanners = await remoteDataSource.getCharacterBanner();

      return Right(characterBanners);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<EquipmentBannerEntity>>>
      getEquipmentBanner() async {
    try {
      final equipmentBanners = await remoteDataSource.getEquipmentBanner();

      return Right(equipmentBanners);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<ElfBannerEntity>>> getElfBanner() async {
    try {
      final elfBanners = await remoteDataSource.getElfBanner();

      return Right(elfBanners);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharacter() async {
    try {
      final characters = await remoteDataSource.getCharacter();

      return Right(characters);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<ElfEntity>>> getElf() async {
    try {
      final elfs = await remoteDataSource.getElf();

      return Right(elfs);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<StigmataEntity>>> getStigmata() async {
    try {
      final stigmatas = await remoteDataSource.getStigmata();

      return Right(stigmatas);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<WeaponEntity>>> getWeapon() async {
    try {
      final weapons = await remoteDataSource.getWeapon();

      return Right(weapons);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<OutfitEntity>>> getOutfit() async {
    try {
      final outfits = await remoteDataSource.getOutfit();

      return Right(outfits);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<TierListEntity>>> getTierList() async {
    try {
      final tierList = await remoteDataSource.getTierList();

      return Right(tierList);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<ChangelogEntity>>> getChangelog() async {
    try {
      final changelogs = await remoteDataSource.getChangelog();

      return Right(changelogs);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<GuideEntity>>> getBeginnerGuide() async {
    try {
      final guides = await remoteDataSource.getBeginnerGuide();

      return Right(guides);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<GuideEntity>>> getGeneralGuide() async {
    try {
      final guides = await remoteDataSource.getGeneralGuide();

      return Right(guides);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, String>> googleSignIn() async {
    try {
      final gAuth = await remoteDataSource.googleSignIn();

      return Right(gAuth);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<void> addChat(
      String userEmail, String otherUserEmail, ChatModel chat) async {
    try {
      await remoteDataSource.addChat(userEmail, otherUserEmail, chat);
    } on SocketException {
      throw "Internet Error";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<ChatModel>>> getChats(
      String userEmail, String otherUserEmail) async {
    try {
      final chats = await remoteDataSource.getChats(userEmail, otherUserEmail);

      return Right(chats);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }
}
