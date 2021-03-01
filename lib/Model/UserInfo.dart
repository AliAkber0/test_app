import 'package:cloud_firestore/cloud_firestore.dart';
import 'SocialModel.dart';

class UserInfoModel {
  String id;
  String userName;
  String email;
  List<dynamic> socialMediaList = [];

  UserInfoModel({
    this.id,
    this.userName,
    this.email,
    this.socialMediaList,
  });

  UserInfoModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    userName = documentSnapshot.get('username');
    email = documentSnapshot.get('email');
  }

  // UserInfoModel.fromMap(Map<dynamic, dynamic> map)
  //     : socialMediaList = map['socialMedias'].map((socialMedias) {
  //         return SocialMedias.fromMap(socialMedias);
  //       }).toList();
}
