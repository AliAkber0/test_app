import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:test_app/Controller/UserController.dart';
import 'package:test_app/Model/SocialModel.dart';
import 'package:test_app/Model/UserInfo.dart';
import 'package:test_app/Screens/SignIn.dart';
import 'package:test_app/Screens/SocialMedia.dart';
import 'package:test_app/Services/Database.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();

  User get user => _firebaseUser.value;

  //
  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createuser(
    String userName,
    String password,
    String email,
    String uid,
  ) async {
    try {
      UserCredential _authResults = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      //UserCredential came from firebase auth

      UserInfoModel _user = UserInfoModel(
        id: _authResults.user.uid,
        userName: userName,
        email: _authResults.user.email,
      );
      if (await Database().createNewUserInfo(_user)) {
        Get.find<UserController>().user = _user;
        Get.to(() => Login());
      }
    } catch (e) {
      print(e);
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.to(() => SocialMedia());
      print('After login function : ' + email);
      Get.put<UserController>(UserController(), permanent: true).user =
          await Database().getUser(_authResult.user.uid);
      print('After User Controller : ' + email);
    } catch (e) {
      print(e);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.back();
      Get.find<UserController>().clear();
    } catch (e) {
      print(e);
    }
  }
}
