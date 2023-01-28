import 'dart:io';

import 'package:honkai_assistance/data/datasources/home_remote_data_source.dart';
import 'package:honkai_assistance/domain/entities/character_banner_entity.dart';
import 'package:honkai_assistance/domain/entities/elf_banner_entity.dart';
import 'package:honkai_assistance/domain/entities/equipment_banner_entity.dart';
import 'package:honkai_assistance/domain/entities/event_entity.dart';
import 'package:honkai_assistance/domain/entities/news_update_entity.dart';
import 'package:honkai_assistance/domain/entities/redeem_code_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/domain/repositories/home_repository.dart';

import '../../common/constant.dart';
import '../../common/error/error.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<RedeemCodeEntity>>> getRedeemCodes() async {
    try {
      final redeemCodes = await homeRemoteDataSource.getRedeemCodes();

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
      final newsUpdates = await homeRemoteDataSource.getNewsUpdate();

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
      final events = await homeRemoteDataSource.getEvents();

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
      final characterBanners = await homeRemoteDataSource.getCharacterBanners();

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
      final equipmentBanners = await homeRemoteDataSource.getEquipmentBanners();

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
      final elfBanners = await homeRemoteDataSource.getElfBanners();

      return Right(elfBanners);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }
}
