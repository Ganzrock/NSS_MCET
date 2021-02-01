import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/providers/articles.dart';
import 'package:flutter_complete_guide/providers/user_details.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:provider/provider.dart';

import '../widgets/pickers/article_image_picker.dart';

class NewArticle extends StatefulWidget {
  static const routeName = '/-article';

  @override
  _NewArticleState createState() => _NewArticleState();
}

class _NewArticleState extends State<NewArticle> {
  File _articleImageFile;
  var _articleTitle = '';
  var _articleContent = '';
  var isEdit = true;
  var _isLoading = false;
  var uploaded = false;

  void _pickedImage(File image) async {
    _articleImageFile = image;
  }

  // Widget _showSnackBar<Snackbar>(String message) {
  //   return SnackBar(
  //     content: Text(message),
  //     backgroundColor: Theme.of(context).errorColor,
  //   );
  // }

  void _submitArticle(
    DateTime date,
    String title,
    String content,
    File image,
    BuildContext ctx,
  ) async {
    if (title.length <= 100) {
      try {
        setState(() {
          _isLoading = true;
          isEdit = false;
        });
        final author = Provider.of<UserData>(ctx, listen: false).userName;
        final userImageUrl = Provider.of<UserData>(ctx, listen: false).imageUrl;
        final uArticleCount =
            Provider.of<UserData>(ctx, listen: false).noOfPost;
        await Provider.of<Articles>(context, listen: false).createArticle(
            author, userImageUrl, title, content, uArticleCount, image);
        setState(() {
          uploaded = true;
        });
      } on PlatformException catch (err) {
        var message = 'An error occurred';

        if (err.message != null) {
          message = err.message;
        }

        setState(() {
          _isLoading = false;
          isEdit = true;
        });
      } catch (err) {
        print(err);
        setState(() {
          _isLoading = false;
          isEdit = true;
        });
      }
    } else {
      SnackBar(
        content: Text(
          'Only 34 characters allowed for title',
          style: TextStyle(color: Colors.blueGrey),
        ),
        backgroundColor: Colors.green,
      );
      setState(() {
        _isLoading = false;
        isEdit = true;
      });
    }
    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.indigo,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Drop Your Article',
          textAlign: TextAlign.left,
          style: theme.textTheme.headline1,
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
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  ArticleImagePicker(_pickedImage),
                  SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    key: ValueKey('title'),
                    decoration: InputDecoration(
                      labelText: "Title",
                      labelStyle: TextStyle(
                        color: Colors.indigo[600],
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      enabled: isEdit,

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
                    height: 20,
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
                    enabled: isEdit,
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
                  SizedBox(height: 20),
                  // FlatButton(
                  //   onPressed: () => _tryValidate(),
                  //   child: Text('Submit'),
                  // ),
                  _isLoading
                      ? uploaded
                          ? Column(
                              children: [
                                Text(
                                  'Article is uploaded successfully !',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 20.0),
                                FlatButton(
                                  child: Text(
                                    'New Article',
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        NewArticle.routeName);
                                  },
                                ),
                              ],
                            )
                          : CircularProgressIndicator()
                      : NiceButton(
                          radius: 50,
                          width: 180,
                          text: "SUBMIT",
                          gradientColors: [
                            Colors.indigo[900],
                            Colors.indigoAccent[700]
                          ],
                          onPressed: () {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                useRootNavigator: false,
                                useSafeArea: false,
                                child: SimpleDialog(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(),
                                          SizedBox(width: 10),
                                          Text('Submitting... Please Wait')
                                        ])
                                  ],
                                ));

                            _submitArticle(
                              DateTime.now(),
                              _articleTitle,
                              _articleContent,
                              _articleImageFile,
                              context,
                            );
                          },
                          background: null,
                        )
                ])),
              )),
        ),
      ),
    );
  }
}
