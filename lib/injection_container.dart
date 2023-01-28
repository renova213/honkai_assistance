import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:honkai_assistance/data/datasources/home_remote_data_source.dart';
import 'package:honkai_assistance/data/repositories/home_repository_impl.dart';
import 'package:honkai_assistance/domain/repositories/home_repository.dart';
import 'package:honkai_assistance/domain/usecases/get_character_banner.dart';
import 'package:honkai_assistance/domain/usecases/get_elf_banner.dart';
import 'package:honkai_assistance/domain/usecases/get_equipment_banner.dart';
import 'package:honkai_assistance/domain/usecases/get_event.dart';
import 'package:honkai_assistance/domain/usecases/get_news_update.dart';
import 'package:honkai_assistance/domain/usecases/get_redeem_code.dart';
import 'package:honkai_assistance/presentation/blocs/character_banner/character_banner_bloc.dart';
import 'package:honkai_assistance/presentation/blocs/elf_banner/elf_banner_bloc.dart';
import 'package:honkai_assistance/presentation/blocs/equipment_banner/equipment_banner_bloc.dart';
import 'package:honkai_assistance/presentation/blocs/event/event_bloc.dart';
import 'package:honkai_assistance/presentation/blocs/news_update/news_update_bloc.dart';
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
  sl.registerLazySingleton<GetNewsUpdate>(
      () => GetNewsUpdate(homeRepository: sl()));
  sl.registerLazySingleton<GetEvent>(() => GetEvent(homeRepository: sl()));
  sl.registerLazySingleton<GetCharacterBanner>(
      () => GetCharacterBanner(homeRepository: sl()));
  sl.registerLazySingleton<GetEquipmentBanner>(
      () => GetEquipmentBanner(homeRepository: sl()));
  sl.registerLazySingleton<GetElfBanner>(
      () => GetElfBanner(homeRepository: sl()));

  //bloc
  sl.registerFactory<RedeemCodeBloc>(() => RedeemCodeBloc(getRedeemCode: sl()));
  sl.registerFactory<NewsUpdateBloc>(() => NewsUpdateBloc(getNewsUpdate: sl()));
  sl.registerFactory<EventBloc>(() => EventBloc(getEvent: sl()));
  sl.registerFactory<CharacterBannerBloc>(
      () => CharacterBannerBloc(getCharacterBanner: sl()));
  sl.registerFactory<EquipmentBannerBloc>(
      () => EquipmentBannerBloc(getEquipmentBanner: sl()));
  sl.registerFactory<ElfBannerBloc>(() => ElfBannerBloc(getElfBanner: sl()));

  //other 3rd party
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
}
