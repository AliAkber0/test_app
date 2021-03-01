import 'package:get/get.dart';
import 'package:test_app/Model/SocialModel.dart';

class SocialMediaController extends GetxController {
  Rx<SocialMedias> _socialMedia = SocialMedias().obs;

  SocialMedias get social => _socialMedia.value;

  set social(SocialMedias value) => this._socialMedia.value = value;

  void clear() {
    _socialMedia.value = SocialMedias();
  }
}
