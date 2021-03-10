import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/Controller/AuthController.dart';

class ShowData extends StatefulWidget {
  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.str,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text("Sign Out"),
              color: Colors.white70,
              onPressed: () {
                Get.find<AuthController>().signOut();
              },
            ),
            Center(child: Text('Hello Welcome !!!')),
            Expanded(
              flex: 1,
              child: Container(
                child: StreamBuilder<QuerySnapshot>(
                  stream: db.collection('users').snapshots(),
                  // initialData: initialData,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var doc = snapshot.data.docs;
                      //List<Widget> list = [];
                      return ListView.builder(
                        addSemanticIndexes: true,
                        shrinkWrap: false,
                        itemCount: doc.length,
                        itemBuilder: (BuildContext context, int index) {
                          var socialMedias = doc[index].get('socialMedias');
                          if (socialMedias != "") {
                            print(socialMedias[0]["snapchat"]);
                          } //list.add(
                          return Center(
                            child: Text(
                              "${doc[index].get('socialMedias')}",
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          );
                          // );
                        },
                      );
                      // return Expanded(
                      //   child: ListView(
                      //     reverse: true,
                      //     children: list,                                                                                               
                      //   ),
                      // );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:test_app/Controller/AuthController.dart';
// import 'package:test_app/Controller/SocialController.dart';
// import 'package:test_app/Controller/UserController.dart';
// import 'package:test_app/Model/SocialModel.dart';
// import 'package:test_app/Services/Database.dart';

// // ignore: must_be_immutable
// class ShowData extends StatefulWidget {
//   // var doc;
//   @override
//   _ShowDataState createState() => _ShowDataState();
// }

// class _ShowDataState extends State<ShowData> {
//   final db = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   appBar: AppBar(),
//     //   body: Padding(
//     //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//     //     child: Column(
//     //       mainAxisAlignment: MainAxisAlignment.center,
//     //       children: [
//     //         Container(
//     //           child: GetX<UserController>(
//     //             initState: (_) async {
//     //               Get.find<UserController>().user = await Database()
//     //                   .getUser(Get.find<AuthController>().user.uid);
//     //             },
//     //             builder: (_) {
//     //               if (_.user.id != null) {
//     //                 return Padding(
//     //                   padding: const EdgeInsets.only(left: 25.0),
//     //                   child: Column(
//     //                     children: [
//     //                       Row(
//     //                         children: [
//     //                           Padding(
//     //                             padding: const EdgeInsets.only(top: 8.0),
//     //                             child: Text(
//     //                               "Hi ",
//     //                               style: TextStyle(
//     //                                 color: Colors.black,
//     //                                 fontSize: 15,
//     //                               ),
//     //                             ),
//     //                           ),
//     //                           SizedBox(
//     //                             width: 5,
//     //                           ),
//     //                           Text(
//     //                             '${_.user.userName},',
//     //                             style: TextStyle(
//     //                               color: Colors.black,
//     //                               fontWeight: FontWeight.bold,
//     //                               fontSize: 15,
//     //                             ),
//     //                           ),
//     //                         ],
//     //                       ),
//     //                     ],
//     //                   ),
//     //                 );
//     //               } else {
//     //                 return Column(
//     //                   crossAxisAlignment: CrossAxisAlignment.start,
//     //                   mainAxisAlignment: MainAxisAlignment.end,
//     //                   children: [
//     //                     Padding(
//     //                       padding:
//     //                           const EdgeInsets.only(bottom: 10.0, left: 15.0),
//     //                       child: Container(
//     //                         alignment: Alignment.bottomLeft,
//     //                         child: Text(
//     //                           'Home',
//     //                           style: TextStyle(
//     //                             fontWeight: FontWeight.bold,
//     //                             color: Colors.black,
//     //                           ),
//     //                         ),
//     //                       ),
//     //                     ),
//     //                     Padding(
//     //                       padding:
//     //                           const EdgeInsets.only(left: 15.0, bottom: 10.0),
//     //                       child: Container(
//     //                         height: 5,
//     //                         width: 35,
//     //                         color: Colors.green[300],
//     //                       ),
//     //                     ),
//     //                   ],
//     //                 );
//     //               }
//     //             },
//     //           ),
//     //         ),
//     //         Text("User Data"),
//     //         SizedBox(height: 50),
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Hello"),
//             Center(
//               child: Expanded(
//                 flex: 1,
//                 child: Container(
//                   child: StreamBuilder<QuerySnapshot>(
//                     stream: db.collection('users').snapshots(),
//                     // initialData: initialData ,
//                     builder: (BuildContext context, AsyncSnapshot snapshot) {
//                       if (snapshot.hasData) {
//                         var doc = snapshot.data.docs;
//                         return ListView.builder(
//                             addSemanticIndexes: true,
//                             shrinkWrap: false,
//                             itemCount: doc.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               return Text(
//                                 doc[index].get('email'),
//                                 style: TextStyle(color: Colors.blueAccent),
//                               );
//                             });
//                       } else {
//                         return CircularProgressIndicator();
//                       }
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//     // Container(
//     //   child: GetX<SocialMediaController>(
//     //     initState: (_) async {
//     //       Get.find<UserController>().user = await Database()
//     //           .getUser(Get.find<AuthController>().user.uid);
//     //     },
//     //     builder: (_) {
//     //       if (_.social != null) {
//     //         return Padding(
//     //           padding: const EdgeInsets.only(left: 25.0),
//     //           child: Column(
//     //             children: [
//     //               Text(
//     //                 'Facebook : ' + '${_.social.facebook}',
//     //                 style: TextStyle(
//     //                   color: Colors.black,
//     //                   fontSize: 15,
//     //                 ),
//     //               ),
//     //               SizedBox(height: 20),
//     //               Text(
//     //                 'Instagram : ' + '${_.social.instagram}',
//     //                 style: TextStyle(
//     //                   color: Colors.black,
//     //                   fontSize: 15,
//     //                 ),
//     //               ),
//     //               SizedBox(height: 20),
//     //               Text(
//     //                 'Snapchat : ' + '${_.social.snapchat}',
//     //                 style: TextStyle(
//     //                   color: Colors.black,
//     //                   fontSize: 15,
//     //                 ),
//     //               ),
//     //               SizedBox(height: 20),
//     //               Text(
//     //                 'Github : ' + '${_.social.github}',
//     //                 style: TextStyle(
//     //                   color: Colors.black,
//     //                   fontSize: 15,
//     //                 ),
//     //               )
//     //             ],
//     //           ),
//     //         );
//     //       } else {
//     //         return Column(
//     //           crossAxisAlignment: CrossAxisAlignment.start,
//     //           mainAxisAlignment: MainAxisAlignment.end,
//     //           children: [
//     //             Padding(
//     //               padding:
//     //                   const EdgeInsets.only(bottom: 10.0, left: 15.0),
//     //               child: Container(
//     //                 alignment: Alignment.bottomLeft,
//     //                 child: Text(
//     //                   'Home',
//     //                   style: TextStyle(
//     //                     fontWeight: FontWeight.bold,
//     //                     color: Colors.black,
//     //                   ),
//     //                 ),
//     //               ),
//     //             ),
//     //             Padding(
//     //               padding:
//     //                   const EdgeInsets.only(left: 15.0, bottom: 10.0),
//     //               child: Container(
//     //                 height: 5,
//     //                 width: 35,
//     //                 color: Colors.green[300],
//     //               ),
//     //             ),
//     //           ],
//     //         );
//     //       }
//     //     },
//     //   ),
//     // ),
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
// }
