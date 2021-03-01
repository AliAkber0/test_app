import 'package:get/get.dart';
import 'package:test_app/Model/UserInfo.dart';


class UserController extends GetxController {
  Rx<UserInfoModel> _userModel = UserInfoModel().obs;

  UserInfoModel get user => _userModel.value;

  set user(UserInfoModel value) => this._userModel.value = value;

  void clear(){
    _userModel.value = UserInfoModel();
  }
}
