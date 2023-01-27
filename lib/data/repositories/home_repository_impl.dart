import 'dart:io';

import 'package:honkai_assistance/data/datasources/home_remote_data_source.dart';
import 'package:honkai_assistance/domain/entities/redeem_code.dart';
import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/domain/repositories/home_repository.dart';

import '../../common/error/error.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<RedeemCode>>> getRedeemCodes(
      String collectionName) async {
    try {
      final redeemCodes =
          await homeRemoteDataSource.getRedeemCodes(collectionName);

      return Right(redeemCodes);
    } on SocketException {
      return const Left(
        InternetFailure(message: "No Internet Connection"),
      );
    }
  }
}
