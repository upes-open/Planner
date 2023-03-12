import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:googleapis/docs/v1.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference eventCollection =
      FirebaseFirestore.instance.collection("events");
  final DocumentReference eventDocument =
      FirebaseFirestore.instance.collection("events").doc();
  // saving user data
  Future savingUserData(String fullName, String email, String dob) async {
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "profilePic": "",
      "dob": dob,
      "uid": uid,
    });
  }

  // gettimg user data
  Future getUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  Future saveEventDetails(
      String eventTitle,
      String description,
      String startDate,
      String startTime,
      String endDate,
      String endTime,
      String eventTag) {
    return userCollection.doc(uid).collection("events").add({
      "eventTitle": eventTitle,
      "description": description,
      "startDate": startDate,
      "startTime": startTime,
      "endDate": endDate,
      "endTime": endTime,
      "eventTag": eventTag
    });
  }

  Future getEventDetails(String uid) async {
    QuerySnapshot snapshot = await userCollection
        .doc(uid)
        .collection("events")
        .orderBy("startTime")
        .get();
    return snapshot;
  }
}
  //get event document id

//   gettinguser groups data
//   getUserGroup() async {
//     return userCollection.doc(uid).snapshots();
//   }

//   //creating group
//   Future createGroup(String userName, String id, String groupName) async {
//     DocumentReference groupDocumentReference = await groupCollection.add({
//       "groupName": groupName,
//       "groupIcon": "",
//       "admin": "${id}_$userName",
//       "members": [],
//       "groupId": "",
//       "recentMessage": "",
//       "recentMessageSender": "",
//     });

//     // update the members and group id
//     await groupDocumentReference.update({
//       "members": FieldValue.arrayUnion(["${uid}_$userName"]),
//       "groupId": groupDocumentReference.id,
//     });

//     DocumentReference userDocumentReference = await userCollection.doc(uid);
//     return await userDocumentReference.update({
//       "groups":
//           FieldValue.arrayUnion(["${groupDocumentReference.id}_$groupName"])
//     });
//   }

//   getChat(String groupId) async {
//     return groupCollection
//         .doc(groupId)
//         .collection("messages  ")
//         .orderBy("time")
//         .snapshots();
//   }

//   Future getGroupAdmin(String groupId) async {
//     DocumentReference d = groupCollection.doc(groupId);
//     DocumentSnapshot snapshot = await d.get();
//     return snapshot['admin'];
//   }

//   getGroupMembers(groupId) async {
//     return groupCollection.doc(groupId).snapshots();
//   }

//   searchGroupByName(String groupName) {
//     return groupCollection.where('groupName', isEqualTo: groupName).get();
//   }

//   Future<bool> isUserJoined(
//       String groupName, String groupId, String userName) async {
//     DocumentReference userDocumentReference = userCollection.doc(uid);
//     DocumentSnapshot documentSnapshot = await userDocumentReference.get();

//     List<dynamic> groups = await documentSnapshot['groups'];
//     if (groups.contains("${groupId}_$groupName")) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   // join and exit group

//   Future togglegroupJoin(
//       String groupId, String userName, String groupName) async {
//     DocumentReference userDocumentReference = userCollection.doc(uid);
//     DocumentReference groupDocumentReference = groupCollection.doc(groupId);

//     DocumentSnapshot snapshot = await userDocumentReference.get();
//     List<dynamic> groups = await snapshot['groups'];

//     if (groups.contains("${groupId}_$groupName")) {
//       await userDocumentReference.update({
//         "groups": FieldValue.arrayRemove(["${groupId}_$groupName"])
//       });
//       await groupDocumentReference.update({
//         "members": FieldValue.arrayRemove(["${uid}_$userName"])
//       });
//     } else {
//       await userDocumentReference.update({
//         "groups": FieldValue.arrayUnion(["${groupId}_$groupName"])
//       });
//       await groupDocumentReference.update({
//         "members": FieldValue.arrayUnion(["${uid}_$userName"])
//       });
//     }
//   }

//   sendMessage(String groupId, Map<String, dynamic> chatMessageData) async {
//     groupCollection.doc(groupId).collection('messages').add(chatMessageData);
//     groupCollection.doc(groupId).update({
//       "recentMessage": chatMessageData['message'],
//       "recentMessageSender": chatMessageData['sender'],
//       "recentMessageTime": chatMessageData['time'].toString(),
//     });
//   }
//
