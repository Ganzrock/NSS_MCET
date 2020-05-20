import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';

import '../widgets/pickers/article_image_picker.dart';

class NewArticle extends StatefulWidget {
  static const routeName = '/new-article';

  @override
  _NewArticleState createState() => _NewArticleState();
}

class _NewArticleState extends State<NewArticle> {
  File _articleImageFile;

  void _pickedImage(File image) {
    _articleImageFile = image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            padding: const EdgeInsets.all(30.0),
            color: Colors.white,
            child: new Container(
              child: new Center(
                  child: new Column(children: [
                new Padding(padding: EdgeInsets.only(top: 60.0)),
                new Text(
                  'DROP YOUR ARTICLE!',
                  style: new TextStyle(
                      color: Colors.indigo[700],
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
                new Padding(padding: EdgeInsets.only(top: 40.0)),
                ArticleImagePicker(_pickedImage),
                SizedBox(height: 30),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(color: Colors.indigo[600]),
                    filled: true,
                    fillColor: Colors.grey[100],

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.indigo),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.indigo),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Title must not be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  style: TextStyle(height: 0.8, color: Colors.indigo[600]),
                  minLines: 10,
                  maxLines: 15,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Content',
                    hintStyle: TextStyle(color: Colors.indigo[600]),
                    filled: true,
                    fillColor: Colors.grey[100],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.indigo),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.indigo),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                NiceButton(
                  radius: 50,
                  width: 180,
                  text: "SUBMIT",
                  gradientColors: [
                    Colors.indigo[900],
                    Colors.indigoAccent[700]
                  ],
                  onPressed: () {},
                  background: null,
                )
              ])),
            )),
      ),
    );
  }
}
