import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageBinding {
  final storage = const FlutterSecureStorage();

  //Encrypts and saves the key with the given value.
  Future<void> writeValue({required String key, dynamic value}) async {
    return storage.write(key: key, value: value);
  }

  //Deletes associated value for the given key
  void deleteValue(String key) async {
    storage.delete(key: key);
  }

  //Deletes all keys with associated values.
  void deleteAll() async {
    storage.deleteAll();
  }

  //Decrypts and returns the value for the given key or null if key is not in
  //the storage.
  Future<String> readValue(String key) async {
    String? value = await storage.read(key: key);
    return value ?? "";
  }

  //Decrypts and returns all keys with associated values.
  Future readAll() async {
    Map<String, String> value = await storage.readAll();
    return value;
  }
}

class LocalStorage {
  static LocalStorage sharedInstance = LocalStorage._internal();

  factory LocalStorage() {
    return sharedInstance;
  }

  LocalStorage._internal();

  LocalStorageBinding localStorageBinding = LocalStorageBinding();

  void writeValue({required String key, dynamic value}) {
    localStorageBinding.writeValue(key: key);
  }

  Future<String> readValue(String key) async {
    return await localStorageBinding.readValue(key);
  }

  Future readAll() async {
    return await localStorageBinding.readAll();
  }

  void deleteValue(String key) async {
    localStorageBinding.deleteValue(key);
  }

  void deleteAll() async {
    return localStorageBinding.deleteAll();
  }
}
