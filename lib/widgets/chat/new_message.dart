import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants.dart';

class NewMessage extends StatefulWidget {
  NewMessage({this.isEdit = false, this.toggleFunction});

  final bool isEdit;
  final Function toggleFunction;
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = new TextEditingController();
  var _enteredMessage = '';

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser();
    final userData =
        await Firestore.instance.collection('users').document(user.uid).get();
    Firestore.instance.collection('chat').add({
      'text': _enteredMessage.trim(),
      'createdAt': DateTime.now().toString(),
      'userId': user.uid,
      'username': userData['username'],
      'userImage': userData['image_url']
    });

    setState(() {
      _enteredMessage = '';
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return widget.isEdit
        ? Positioned(
            bottom: 0.0,
            child: Container(
              margin: EdgeInsets.only(left: 2, bottom: 2.0),
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: width - 60.0,
                    child: Card(
                      elevation: 5.0,
                      // color: Colors.indigo[100],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: TextField(
                          controller: _controller,
                          textCapitalization: TextCapitalization.sentences,
                          autocorrect: true,
                          enableSuggestions: true,
                          maxLines: 8,
                          minLines: 1,
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            // labelText: 'Something important',
                            hintText: 'Type your Message',
                            hintStyle: TextStyle(fontSize: 15.0),
                            labelStyle: TextStyle(fontSize: 15.0),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: InputBorder.none,
                          ),
                          canAssertMaterialLocalizations: false,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontFamily: 'MonSerrat',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _enteredMessage = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width / (width / 50),
                    height: width / (width / 50),
                    child: Card(
                      elevation: 5.0,
                      // color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(55.0))),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              // Color.fromRGBO(68, 80, 226, 0.9),
                              // Color.fromRGBO(110, 38, 199, 0.9),
                              gradientStartColor,
                              gradientEndColor,
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(55.0),
                          ),
                        ),
                        child: IconButton(
                            color: Colors.white,
                            icon: Icon(Icons.send, size: 18.0),
                            onPressed: () {
                              if (_enteredMessage.trim().isEmpty) {
                                widget.toggleFunction(widget.isEdit);
                              } else {
                                _sendMessage();
                              }
                            }),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : Positioned(
            right: 12.0,
            bottom: 12.0,
            child: Container(
              width: width / (width / 50),
              height: width / (width / 50),
              child: Card(
                elevation: 5.0,
                // color: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(55.0),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        // Color.fromRGBO(68, 80, 226, 0.9),
                        // Color.fromRGBO(110, 38, 199, 0.9),
                        gradientStartColor,
                        gradientEndColor,
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(55.0),
                    ),
                  ),
                  child: IconButton(
                    color: Colors.orangeAccent,
                    icon:
                        Icon(Icons.message, size: 17.0, color: Colors.white70),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          actionsPadding: EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          title: Text('Respect Your Privacy'),
                          content: Text(
                              '''The messages you send are visible to everyone who has this application installed.

It is your duty to respect your privacy and Dignity. 

Your profile photo and name will be visible if you send Messages. 

You are requested to send only important messages like  
  A. College Events 
  B. News  
  C. Emergency  '''),
                          actions: [
                            FlatButton(
                                child: Text('No'),
                                onPressed: () {
                                  widget.toggleFunction(false);
                                  Navigator.of(context).pop();
                                }),
                            RaisedButton(
                              child: Text('Yes, I Admit'),
                              onPressed: () {
                                widget.toggleFunction(true);
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
  }
}
