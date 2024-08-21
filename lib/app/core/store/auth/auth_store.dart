import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

import '../../service/local_storage/i_local_storage.dart';
import 'auth_status.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final ILocalStorage storage;
  @observable
  // LoggedUser? user;

  @action
  // setUser(LoggedUser user) => this.user = user;

  _AuthStoreBase(this.storage) {
    reaction((_) => status, (_) {
      switch (status) {
        case AuthStatus.Onboard:
          Modular.to.navigate("/start/onboard");
          break;
        case AuthStatus.Start:
          Modular.to.navigate("/");
          break;
        case AuthStatus.Initial:
          Modular.to.navigate("/auth/login/");
          break;
        default:
      }
    });
  }

  @observable
  AuthStatus? status;

  @action
  void setStatus(AuthStatus value) => status = value;

  Future<void> checkOnboard() async {
    // setStatus(AuthStatus.Start);

    await Future.delayed(Duration(seconds: 2));

    setStatus(AuthStatus.Start);
    return;
  }

  Future<void> loadDatabase() async {
    //TODO remover ou refatorar para o novo banco de dados
    try {
      await Future.wait([
        Hive.openBox(
          "app",
          // encryptionCipher: HiveAesCipher(encryptionKey),
        ),
        Hive.openBox(
          "locale",
          // encryptionCipher: HiveAesCipher(encryptionKey),
        ),
        Hive.openBox("modules"),
        Hive.openBox("budget"),
      ]);
    } catch (_) {
      exit(1);
    }
  }
}
