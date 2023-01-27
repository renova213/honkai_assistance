import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:honkai_assistance/data/datasources/home_remote_data_source.dart';
import 'package:honkai_assistance/data/repositories/home_repository_impl.dart';
import 'package:honkai_assistance/domain/repositories/home_repository.dart';
import 'package:honkai_assistance/domain/usecases/get_redeem_code.dart';
import 'package:honkai_assistance/presentation/blocs/redeem_code/redeem_code_bloc.dart';

final sl = GetIt.instance;

void setUp() {
  //datasource
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(firestoreService: sl()));

  //repository
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeRemoteDataSource: sl()));

  //usecase
  sl.registerLazySingleton<GetRedeemCode>(
      () => GetRedeemCode(homeRepository: sl()));

  //bloc
  sl.registerFactory<RedeemCodeBloc>(() => RedeemCodeBloc(getRedeemCode: sl()));

  //other 3rd party
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
}
