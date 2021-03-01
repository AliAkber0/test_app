import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/Model/SocialModel.dart';
import '../Model/UserInfo.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUserInfo(UserInfoModel _users) async {
    try {
      await _firestore.collection('users').doc(_users.id).set({
        'username': _users.userName,
        'email': _users.email,
        'socialMedias': _users.socialMediaList,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Future<bool> createSocialInfo(
  //     SocialModel _social, UserInfoModel _user) async {
  //   try {
  //     await _firestore.collection('users').doc(_user.id).set({
  //       'faccebook': _social.facebook,
  //       'instagram': _social.instagram,
  //       'snapchat': _social.snapchat,
  //       'github': _social.github,
  //     });
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  Future<UserInfoModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection('users').doc(uid).get();

      return UserInfoModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
