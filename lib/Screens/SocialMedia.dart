import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/Controller/AuthController.dart';
import 'package:test_app/Controller/UserController.dart';
import 'package:test_app/Model/SocialModel.dart';
import 'package:test_app/Services/Database.dart';
// import 'package:get/get.dart';
// import 'package:test_app/Controller/SocialController.dart';

class SocialMedia extends StatefulWidget {
  // final text
  @override
  _SocialMediaState createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  // var selectedid, selectedType;
  String facebook, instagram, snapchat, github, sid;
  SocialMedias socialMedias = SocialMedias();

  // createSocialmedia() async {
  //   // print(selectedBook);
  //   if (facebook != null ||
  //       instagram != null ||
  //       snapchat != null ||
  //       github != null) {
  //     List event = [
  //       'Facebook: ' + facebook,
  //       'Instagram: ' + instagram,
  //       'Snapchat: ' + snapchat,
  //       'Github: ' + github
  //     ];

  //     print(event);

  //     DocumentReference documentReference = FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(Get.find<AuthController>().user.uid);

  //     DocumentSnapshot documentSnapshot = await documentReference.get();

  //     List socialMedia = documentSnapshot.data()['socialMedia'];

  //     print(socialMedia);

  //     if (socialMedia.contains(event) == true) {
  //       print(event);
  //       documentReference.update({
  //         'socialMedia': FieldValue.arrayUnion(event),
  //       }).whenComplete(() => {print("Social Media Added")});
  //     } else {
  //       print(event);
  //     }

  //     // Map<String, dynamic> social = {
  //     //   "facebook": facebook,
  //     //   "instagram": instagram,
  //     //   "snapchat": snapchat,
  //     //   "github": github,
  //     // };
  //     // documentReference
  //     //     .set(social)
  //     //     .whenComplete(() => {print("Social Media Added")});
  //   }
  // }

  void addSocialMedias() {
    SocialMedias socialMedias = SocialMedias(
      facebook: facebook,
      instagram: instagram,
      snapchat: snapchat,
      github: github,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(Get.find<AuthController>().user.uid)
        .update({
      'socialMedias': FieldValue.arrayUnion([socialMedias.toMap()])
    }).whenComplete(() => 'Social Medias');
  }

  getFacebook(facebook) {
    this.facebook = facebook;
  }

  getInstagram(instagram) {
    this.instagram = instagram;
  }

  getSnapchat(snapchat) {
    this.snapchat = snapchat;
  }

  getGithub(github) {
    this.github = github;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: GetX<UserController>(
                  initState: (_) async {
                    Get.find<UserController>().user = await Database()
                        .getUser(Get.find<AuthController>().user.uid);
                  },
                  builder: (_) {
                    if (_.user.id != null) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Hi",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${_.user.userName},',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10.0, left: 15.0),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'Home',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, bottom: 10.0),
                            child: Container(
                              height: 5,
                              width: 35,
                              color: Colors.green[300],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              Text("Enter the User Data"),
              SizedBox(height: 50),
              TextField(
                // controller: facebookController,
                onChanged: (String facebook) {
                  getFacebook(facebook);
                },
                decoration: InputDecoration(hintText: 'Facebook Username'),
              ),
              SizedBox(height: 10),
              TextField(
                // controller: instagramController,
                onChanged: (String instagram) {
                  getInstagram(instagram);
                },
                decoration: InputDecoration(hintText: 'Instagram Username'),
              ),
              SizedBox(height: 10),
              TextField(
                // controller: githubController,
                onChanged: (String github) {
                  getGithub(github);
                },
                decoration: InputDecoration(hintText: 'Github Username'),
              ),
              SizedBox(height: 10),
              TextField(
                // controller: snapchatController,
                onChanged: (String snapchat) {
                  getSnapchat(snapchat);
                },
                decoration: InputDecoration(hintText: 'Snapchat Username'),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // controller.createScialinfo(
                  //   facebookController.text,
                  //   instagramController.text,
                  //   snapchatController.text,
                  //   githubController.text,
                  //   idController.text,
                  // );
                  addSocialMedias();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/ShowData');
                  // socialMedias.readSocialMedias();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: Text(
                    'Show Data',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
