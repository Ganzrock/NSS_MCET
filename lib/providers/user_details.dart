import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {
  // final String userName;
  // final String userId;
  // final String bloodGroup;
  // final String noOfPost;

  // User({
  //   @required this.userName,
  //   @required this.userId,
  //   this.bloodGroup,
  //   this.noOfPost,
  // });

  Future<DocumentSnapshot> get userData async {
    final user = await FirebaseAuth.instance.currentUser();
    return Firestore.instance.collection('users').document(user.uid).get();
  }
}
