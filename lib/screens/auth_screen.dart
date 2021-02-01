import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_complete_guide/screens/home_screen.dart';

import 'package:flutter_complete_guide/widgets/auth/auth_form.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;
  int noOfPost = 0;

  void _submitAuthForm(
    String email,
    String password,
    String username,
    String rollNumber,
    String bloodGroup,
    bool isDonor,
    File image,
    bool isLogin,
    BuildContext ctx,
  ) async {
    AuthResult authResult;

    try {
      setState(() {
        _isLoading = true;
      });

      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      } else {
        // authResult = await _auth.createUserWithEmailAndPassword(
        //   email: email,
        //   password: password,
        // );

        //   final ref = FirebaseStorage.instance
        //       .ref()
        //       .child('user_image')
        //       .child(username + DateTime.now().toString() + '.jpg');

        //   await ref.putFile(image).onComplete;

        //   final url = await ref.getDownloadURL();

        //   await Firestore.instance
        //       .collection('new-users')
        //       .document(authResult.user.uid)
        //       .setData({
        //     'username': username,
        //     'email': email,
        //     'image_url': url,
        //     'rollnumber': rollNumber,
        //     'bloodGroup': bloodGroup,
        //     'noOfPost': noOfPost,
        //     'isDonor': isDonor ? 'Yes' : 'No',
        //     'bio': 'Add Bio',
        //     'bookmarks': [],
        //   });

        await http.post(
            "https://script.google.com/macros/s/AKfycbzhpdP5_qVJYfy5w93ZTWxXrIKnksXxIcKp9puPEA/exec",
            body: {
              'email': email,
              'username': username,
              'rollnumber': rollNumber,
              'bloodGroup': bloodGroup,
            });

        showDialog(
          context: context,
          builder: (_) => SimpleDialog(children: [
            Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    'Check Your mail within 2 hours for login credentials. Your account creation request has been submitted. Your account will be activated once it is verified by the senior volunteers. If there is delay due to some reasons feel free to contact the senior volunteers.   \nFor Queries Contact: \nPh: +91 637 444 0261, \n+91 960 098 1203\n+91 908 034 9839\nMail : nssmcet24@gmail.com.\n Thank You for your Interest.'))
          ]),
        );
      }

      setState(() {
        _isLoading = false;
      });
    } on PlatformException catch (err) {
      var message = 'An error occurred, pelase check your credentials!';

      if (err.message != null) {
        message = err.message;
      }

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthForm(_submitAuthForm, _isLoading),
    );
  }
}
