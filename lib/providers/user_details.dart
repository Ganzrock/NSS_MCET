import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserData with ChangeNotifier {
  FirebaseUser currentUser;
  DocumentSnapshot user;

  var _userName = '';
  var _imageUrl = 'https://picsum.photos/200/300';
  var _noOfPost = 0;
  var _isDonor = '';
  var _bloodGroup = '';
  var _bio = '';
  var _rollNumber = '';
  var _email = '';
  var uid = '';
  List<String> _bookmarks = [];
  Future<void> get setUser async {
    currentUser = await FirebaseAuth.instance.currentUser();
    uid = currentUser.uid;
    await Firestore.instance
        .collection('users')
        .document(currentUser.uid)
        .get()
        .then((value) {
      user = value;
    });

    _userName = user.data['username'];
    _imageUrl = user.data['image_url'];
    _noOfPost = user.data['noOfPost'];
    _isDonor = user.data['isDonor'];
    _bloodGroup = user.data['bloodGroup'];
    _email = user.data['email'];
    _bio = user.data['bio'];
    _rollNumber = user.data['rollnumber'];
    final _bookmarksData = user.data['bookmarks'];

    if (_bookmarksData.isNotEmpty)
      _bookmarksData.forEach((b) => _bookmarks.add(b.toString()));
    notifyListeners();
    return null;
  }

  String get imageUrl {
    var imgUrl = _imageUrl;
    return imgUrl;
  }

  String get userName {
    var username = _userName;
    return username;
  }

  int get noOfPost {
    final noofpost = _noOfPost;
    return noofpost;
  }

  String get rollNumber {
    final rollnumber = _rollNumber;
    return rollnumber;
  }

  String get bio {
    final bioUser = _bio;
    return bioUser;
  }

  String get email {
    final emailUser = _email;
    return emailUser;
  }

  String get isDonor {
    final isdonor = _isDonor;
    print(isdonor);
    return isdonor;
  }

  String get bloodGroup {
    final bloodgroup = _bloodGroup;
    return bloodgroup;
  }

  String get uId {
    final uID = uid;
    return uID;
  }

  void get notify {
    notifyListeners();
    return;
  }

  Future<void> toggleBloodDonor(String isDonor) async {
    await Firestore.instance
        .collection('users')
        .document(currentUser.uid)
        .updateData({'isDonor': isDonor == 'Yes' ? 'No' : 'Yes'});
    await setUser;
    return;
  }

  Future<void> sendFeedback(String message) async {
    await Firestore.instance
        .collection('feedback')
        .document(DateTime.now().toString() + currentUser.uid)
        .setData({
      'createdAt': DateTime.now().toString(),
      'message': message,
      'userId': currentUser.uid
    });
  }

  Future<void> addBookmark(String id) async {
    _bookmarks.add(id);
    await Firestore.instance.collection('users').document(id).updateData({
      'bookmarks': _bookmarks,
    });
  }
}
