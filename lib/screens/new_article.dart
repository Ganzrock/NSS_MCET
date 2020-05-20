import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/providers/user_details.dart';
import 'package:nice_button/NiceButton.dart';

import '../widgets/pickers/article_image_picker.dart';

class NewArticle extends StatefulWidget {
  static const routeName = '/-article';

  @override
  _NewArticleState createState() => _NewArticleState();
}

class _NewArticleState extends State<NewArticle> {
  final _formKey = GlobalKey<FormState>();
  File _articleImageFile;
  var _articleTitle = '';
  var _articleContent = '';

  var _isLoading = false;

  var author = '';

  void _pickedImage(File image) {
    _articleImageFile = image;
  }

  // Widget _showSnackBar<Snackbar>(String message) {
  //   return SnackBar(
  //     content: Text(message),
  //     backgroundColor: Theme.of(context).errorColor,
  //   );
  // }

  String get userName {
    User().userData.then((DocumentSnapshot doc) {
      setState(() {
        author = doc['username'];
      });
    });
    return author;
  }

  void _submitArticle(
    String username,
    DateTime date,
    String title,
    String content,
    File image,
    BuildContext ctx,
  ) async {
    try {
      setState(() {
        _isLoading = true;
      });

      final user = await FirebaseAuth.instance.currentUser();

      final ref = FirebaseStorage.instance
          .ref()
          .child('article_image')
          .child(username)
          .child(user.uid + '${DateTime.now().toString()}.jgp');

      await ref.putFile(image).onComplete;

      final url = await ref.getDownloadURL();

      await Firestore.instance
          .collection('users')
          .document(user.uid)
          .collection('articles')
          .document(user.uid + '${date.toString()}')
          .setData({
        'author': username,
        'title': title,
        'content': content,
        'image_url': url,
        'claps': 0,
        'time': date
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

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          child: Container(
              padding: const EdgeInsets.all(25.0),
              color: Colors.white,
              child: Container(
                child: Center(
                    child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Text(
                    'DROP YOUR ARTICLE!',
                    style: TextStyle(
                        color: Colors.indigo[700],
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                  ),
                  ArticleImagePicker(_pickedImage),
                  Text(userName), SizedBox(height: 30),
                  TextFormField(
                    key: ValueKey('title'),
                    decoration: InputDecoration(
                      labelText: "Title",
                      labelStyle: TextStyle(
                        color: Colors.indigo[600],
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            20.0,
                          ),
                        ),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                        ),
                      ),
                      //fillColor: Colors.green
                    ),
                    onChanged: (value) {
                      _articleTitle = value;
                    },
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    key: ValueKey('content'),
                    style: TextStyle(
                      height: 0.8,
                      color: Colors.indigo[600],
                    ),
                    minLines: 15,
                    maxLines: 100,
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: 'Content',
                      hintStyle: TextStyle(
                        color: Colors.indigo[600],
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10.0,
                          ),
                        ),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10.0,
                          ),
                        ),
                        borderSide: BorderSide(
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      _articleContent = value;
                    },
                  ),
                  SizedBox(height: 30),
                  // FlatButton(
                  //   onPressed: () => _tryValidate(),
                  //   child: Text('Submit'),
                  // ),
                  NiceButton(
                    radius: 50,
                    width: 180,
                    text: "SUBMIT",
                    gradientColors: [
                      Colors.indigo[900],
                      Colors.indigoAccent[700]
                    ],
                    onPressed: () => _submitArticle(
                      author,
                      DateTime.now(),
                      _articleTitle,
                      _articleContent,
                      _articleImageFile,
                      context,
                    ),
                    background: null,
                  )
                ])),
              )),
        ),
      ),
    );
  }
}
