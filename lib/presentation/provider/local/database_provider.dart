import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/menu_database.dart';
import 'package:honkai_assistance/domain/usecases/local/menu_database_usecase.dart';

class DatabaseProvider extends ChangeNotifier {
  final MenuDatabaseUsecase menuDatabaseUsecase;
  DatabaseProvider({required this.menuDatabaseUsecase});

  List<MenuDatabase> _menuDatabases = [];

  List<MenuDatabase> get menuDatabases => _menuDatabases;

  Future<void> getMenuDatabase() async {
    _menuDatabases = await menuDatabaseUsecase.call();
    notifyListeners();
  }
}
