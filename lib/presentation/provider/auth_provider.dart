import 'package:flutter/material.dart';
import 'package:honkai_assistance/common/util/enum_state.dart';
import 'package:honkai_assistance/domain/usecases/post_google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  final PostGoogleSignIn postGoogleSignIn;
  AuthProvider({required this.postGoogleSignIn});

  String _failureMessage = "";
  String _emailUser = "";
  AppState _appState = AppState.loading;

  String get failureMessage => _failureMessage;
  AppState get appstate => _appState;
  String get emailUser => _emailUser;

  Future<void> googleSignIn() async {
    changeAppState(AppState.loading);

    final failureOEmail = await postGoogleSignIn.call();

    failureOEmail.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (email) {
        _emailUser = email;
        changeAppState(AppState.loaded);
      },
    );
  }

  void changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}
