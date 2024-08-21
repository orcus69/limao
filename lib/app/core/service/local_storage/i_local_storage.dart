abstract class ILocalStorage {
  Map getData({required key});
  Map getKeyData({required boxKey, required dataKey});
  void setBool({
    required String box,
    required String key,
    required bool value,
  });
  Future<bool> getBool({required String box, required String key});
  Future<bool> saveData(
      {required String key, required Map<dynamic, dynamic> data});
  Future<bool> saveKeyData(
      {required String boxKey,
      required String dataKey,
      required Map<dynamic, dynamic> data});

  Future<bool> updateKeyData(
      {required String boxKey,
      required String dataKey,
      required Map<dynamic, dynamic> data});
  Future<bool> clearBox({required String boxKey});
  Future<bool> removeKeyData({required String boxKey, required String dataKey});

}