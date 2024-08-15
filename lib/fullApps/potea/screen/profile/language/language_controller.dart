import 'package:get/get.dart';
import 'package:access_maketicket/fullApps/potea/screen/profile/language/language_model.dart';

class LanguageController extends GetxController {
  var lang = <LanguageModel>[
    LanguageModel(lang: 'English (US)'),
    LanguageModel(lang: 'English (UK)'),
    LanguageModel(lang: 'Mandarin'),
    LanguageModel(lang: 'Hindi'),
    LanguageModel(lang: 'Spanish'),
    LanguageModel(lang: 'French'),
    LanguageModel(lang: 'Arabic'),
    LanguageModel(lang: 'Bengali'),
    LanguageModel(lang: 'Russian'),
    LanguageModel(lang: 'Indonesian'),
  ].obs;

  var selectedlang = Rx<LanguageModel?>(null);

  void setSelectedlang(LanguageModel? langs) {
    selectedlang.value = langs;
  }
}
