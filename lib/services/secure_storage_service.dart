// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
//
//
// class SecureStorageService {
//   final _secureStorage = const FlutterSecureStorage();
//   // final options = IOSOptions(accessibility: IOSAccessibility.first_unlock);
//
//   static final SecureStorageService _service = SecureStorageService._service;
//
//   factory SecureStorageService() {
//     return _service;
//   }
//
//   SecureStorageService._internal();
//
//   Future<void> writeSecureString(String key, String value) async {
//     await _secureStorage.write(
//         key: key, value: value, aOptions: _getAndroidOptions());
//   }
//
//   Future<String?> readSecureData(String key) async {
//     var readData =
//     await _secureStorage.read(key: key, aOptions: _getAndroidOptions());
//     return readData;
//   }
//
//   Future<void> deleteSecureData(String key) async {
//     await _secureStorage.delete(key: key, aOptions: _getAndroidOptions());
//   }
//
//   Future<bool> containsKeyInSecureData(String key) async {
//     var containsKey = await _secureStorage.containsKey(key: key, aOptions: _getAndroidOptions());
//     return containsKey;
//   }
//
//   Future<Map<String, String>> readAllSecureData() async {
//     var allData = await _secureStorage.readAll(aOptions: _getAndroidOptions());
//     return allData;
//   }
//
//   Future<void> deleteAllSecureData() async {
//     await _secureStorage.deleteAll(aOptions: _getAndroidOptions());
//   }
//
//   AndroidOptions _getAndroidOptions() => const AndroidOptions(
//     encryptedSharedPreferences: true,
//   );
//
// }