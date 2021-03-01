import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:test_app/Controller/AuthController.dart';

class SocialMedias {
  String facebook;
  String instagram;
  String snapchat;
  String github;

  SocialMedias({this.facebook, this.instagram, this.snapchat, this.github});

  Map<String, dynamic> toMap() => {
        'facebook': this.facebook,
        'instagram': this.instagram,
        'snapchat': this.snapchat,
        'github': this.github,
      };

  SocialMedias.fromMap(Map<dynamic, dynamic> map)
      : facebook = map['facebook'].toString(),
        instagram = map['instagram'].toString(),
        snapchat = map['snapchat'].toString(),
        github = map['github'].toString();

  void readSocialMedias() {
    print('Im in Read Function');
    SocialMedias socialMedias;
    FirebaseFirestore.instance
        .collection('users')
        .doc(Get.find<AuthController>().user.uid)
        .get()
        .then((docSnapshot) => {
              socialMedias =
                  SocialMedias.fromMap(docSnapshot.data()['socialMedias'][0]),
              // "Data : " + docSnapshot.data.toString(),
              "facebook : " + socialMedias.facebook.toString(),
              "instagram : " + socialMedias.instagram.toString(),
              "snapchat : " + socialMedias.snapchat.toString(),
              "github : " + socialMedias.github.toString(),
            });
  }
}


// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:test_app/Screens/SocialMedia.dart';

// // class SocialModel {
// //   List<SocialMedia> socialMedia;

// //   SocialModel({this.socialMedia});

// //   SocialModel fromMap(Map<String, dynamic> map) {
// //     return SocialModel(socialMedia: map['SocialMedia']);
// //   }

// //   Map<String, dynamic> toMap() => {
// //         'SocialMedia': socialMedia,
// //       };

// //   // SocialModel(
// //   //     {this.id, this.facebook, this.instagram, this.snapchat, this.github});

// //   // SocialModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
// //   //   id = documentSnapshot.id;
// //   //   facebook = documentSnapshot.get('facebook');
// //   //   instagram = documentSnapshot.get('instagram');
// //   //   snapchat = documentSnapshot.get('snapchat');
// //   //   github = documentSnapshot.get('github');
// //   // }
// // }

// class SocialMedias {

// }

