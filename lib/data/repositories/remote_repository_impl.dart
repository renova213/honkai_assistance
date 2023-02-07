import 'dart:io';

import 'package:honkai_assistance/domain/entities/character_banner_entity.dart';
import 'package:honkai_assistance/domain/entities/elf_banner_entity.dart';
import 'package:honkai_assistance/domain/entities/elf_entity.dart';
import 'package:honkai_assistance/domain/entities/equipment_banner_entity.dart';
import 'package:honkai_assistance/domain/entities/event_entity.dart';
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
  Future<Either<Failure, List<RedeemCodeEntity>>> getRedeemCodes() async {
    try {
      final redeemCodes = await remoteDataSource.getRedeemCodes();

      return Right(redeemCodes);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<NewsUpdateEntity>>> getNewsUpdates() async {
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
  Future<Either<Failure, List<EventEntity>>> getEvents() async {
    try {
      final events = await remoteDataSource.getEvents();

      return Right(events);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<CharacterBannerEntity>>>
      getCharacterBanners() async {
    try {
      final characterBanners = await remoteDataSource.getCharacterBanners();

      return Right(characterBanners);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<EquipmentBannerEntity>>>
      getEquipmentBanners() async {
    try {
      final equipmentBanners = await remoteDataSource.getEquipmentBanners();

      return Right(equipmentBanners);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<ElfBannerEntity>>> getElfBanners() async {
    try {
      final elfBanners = await remoteDataSource.getElfBanners();

      return Right(elfBanners);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharacters() async {
    try {
      final characters = await remoteDataSource.getCharacters();

      return Right(characters);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<ElfEntity>>> getElfs() async {
    try {
      final elfs = await remoteDataSource.getElfs();

      return Right(elfs);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<StigmataEntity>>> getStigmatas() async {
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
  Future<Either<Failure, List<WeaponEntity>>> getWeapons() async {
    try {
      final weapons = await remoteDataSource.getWeapons();

      return Right(weapons);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }

  @override
  Future<Either<Failure, List<OutfitEntity>>> getOutfits() async {
    try {
      final outfits = await remoteDataSource.getOutfits();

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
}
