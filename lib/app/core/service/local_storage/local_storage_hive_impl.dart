import 'package:easy_localization/easy_localization.dart';
import 'package:caracolibras/app/core/service/local_storage/i_local_storage.dart';
import 'package:hive/hive.dart';

class LocalStorageHiveImpl implements ILocalStorage {
  @override
  Map getData({required key}) {
    try {
      return Hive.box(key).toMap();
    } catch (e) {
      return {};
    }
  }

  @override
  Future<bool> saveData({required String key, required Map data}) async {
    await Hive.box(key).putAll(data);
    return true;
  }

  @override
  Future<bool> getBool({required String box, required String key}) async {
    return await Hive.box(box).get(key, defaultValue: false);
  }

  @override
  void setBool(
      {required String box, required String key, required bool value}) {
    Hive.box(box).put(key, value);
  }

  @override
  Map getKeyData({required boxKey, required dataKey}) {
    try {
      return Hive.box(boxKey).get(dataKey);
    } catch (e) {
      return {};
    }
  }

  @override
  Future<bool> saveKeyData(
      {required String boxKey,
      required String dataKey,
      required Map data}) async {
    try {
      await Hive.box(boxKey).put(dataKey, data);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateKeyData(
      {required String boxKey,
      required String dataKey,
      required Map data}) async {
    try {
      await removeKeyData(boxKey: boxKey, dataKey: dataKey);
      await saveKeyData(boxKey: boxKey, dataKey: dataKey, data: data);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> clearBox({required String boxKey}) async {
    Hive.box(boxKey).clear();
    return true;
  }

  @override
  Future<bool> removeKeyData(
      {required String boxKey, required String dataKey}) async {
    try {
      await Hive.box(boxKey).delete(dataKey);
      return true;
    } catch (e) {
      return false;
    }
  }
}
