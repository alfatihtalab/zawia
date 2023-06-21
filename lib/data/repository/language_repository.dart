//
//
//
//
// import 'package:flutter/material.dart';
// import '../../services/local_storage_service.dart';
// import '../../utilties/constants/app_constants.dart';
//
//
// class LanguageRepository {
//   LanguageRepository();
//
//   // final LocalStorageService storageService;
//
// //  TODO get current Language from local storage and default is Arabic
//   Locale getCurrentLanguage() {
//     final languageCode = storageService.getStringKey(PersistenceKey.localeCodeKey);
//     if (languageCode != null) {
//       return Locale(languageCode);
//     }
//     return const Locale("ar");
//   }
//
// // TODO set current Language
//   void setCurrentLanguage({required String languageCode}) {
//     storageService.setStringKey(PersistenceKey.localeCodeKey, languageCode);
//   }
// }
