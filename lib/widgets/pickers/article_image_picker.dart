import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ArticleImagePicker extends StatefulWidget {
  ArticleImagePicker(this.imagePickFn);

  final void Function(File pickedImage) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<ArticleImagePicker> {
  File _pickedImage;

  void _pickImage() async {
    final pickedImageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxWidth: 300,
    );
    setState(() {
      _pickedImage = pickedImageFile;
    });
    widget.imagePickFn(pickedImageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.grey[100],
          elevation: 10,
          child: new Container(
            padding: _pickedImage != null
                ? EdgeInsets.all(5.0)
                : EdgeInsets.all(15.0),
            child: new Column(
              children: <Widget>[
                new Container(
                  child: _pickedImage != null
                      ? Image.file(
                          _pickedImage,
                          fit: BoxFit.cover,
                        )
                      : IconButton(
                          icon: Icon(Icons.camera_alt),
                          color: Colors.indigo[900],
                          onPressed: _pickImage,
                        ),
                  width: _pickedImage != null
                      ? MediaQuery.of(context).size.width * 0.8
                      : 50.0,
                  height: _pickedImage != null
                      ? MediaQuery.of(context).size.width * 0.5
                      : 50.0,
                ),
              ],
            ),
          ),
        ),
        _pickedImage == null
            ? Container()
            : ButtonBar(
                children: <Widget>[
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _pickImage,
                    child: Text('Change'),
                  ),
                  RaisedButton(
                    child: Text('Cancel'),
                    color: Colors.red[600],
                    onPressed: () {
                      setState(() {
                        _pickedImage = null;
                      });
                    },
                  )
                ],
              )
      ],
    );
  }
}
