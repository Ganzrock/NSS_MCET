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
      imageQuality: 50,
      maxWidth: 150,
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
            padding: new EdgeInsets.all(15.0),
            child: new Column(
              children: <Widget>[
                new IconButton(
                  icon: _pickedImage != null
                      ? FileImage(_pickedImage)
                      : Icon(Icons.camera_alt),
                  iconSize: 50.0,
                  color: Colors.indigo[900],
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        FlatButton.icon(
          textColor: Theme.of(context).primaryColor,
          onPressed: _pickImage,
          icon: Icon(Icons.image),
          label: Text('Add Image'),
        ),
      ],
    );
  }
}
