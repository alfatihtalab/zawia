// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import '../../data/repository/language_repository.dart';
// part 'localization_state.dart';
//
// class LocalizationCubit extends Cubit<LocalizationState> {
//   LocalizationCubit(this._languageRepository) : super(const LocalizationInitial(Locale('ar')));
//
//   final LanguageRepository _languageRepository;
//   String currentLanguageCode = "ar";
//
//
//   String selectedLanguage = "";
//
//   late Locale currentLocale;
//
// //  TODO set current language code
//   Future<void> setCurrentLanguage({required LanguageEnum languageEnum})async{
//     String languageCode = 'ar';
//     if(languageEnum == LanguageEnum.arabic){
//       languageCode = 'ar';
//       selectedLanguage = 'العربية';
//       toArabic();
//     } else if(languageEnum == LanguageEnum.english){
//       languageCode = 'en';
//       selectedLanguage = 'English';
//
//       toEnglish();
//     }
//     _languageRepository.setCurrentLanguage(languageCode: languageCode);
//
//   }
// //  TODO get current language code
//   Future<void> getCurrentLanguage()async{
//     currentLocale = _languageRepository.getCurrentLanguage();
//
//     // return currentLocale;
//   }
//   void toArabic() => emit(const SelectedLocale(Locale('ar')));
//
//   void toEnglish() => emit(const SelectedLocale(Locale('en')));
//
// }
//
// enum LanguageEnum{arabic, english}
//
