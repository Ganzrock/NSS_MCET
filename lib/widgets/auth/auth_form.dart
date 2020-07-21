import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/widgets/pickers/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  AuthForm(
    this.submitFn,
    this.isLoading,
  );

  final bool isLoading;
  final void Function(
    String email,
    String password,
    String userName,
    String rollNumber,
    String bloodGroup,
    bool isDonor,
    File image,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _repassword = '';
  var _rollNumber = '';
  var _bloodGroup = 'O+';
  var _isDonor = false;
  File _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  Widget _showSnackBar<Snackbar>(String message) {
    return SnackBar(
      content: Text(message),
      backgroundColor: Theme.of(context).errorColor,
    );
  }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (_userImageFile == null && !_isLogin) {
      Scaffold.of(context).showSnackBar(
        _showSnackBar(
          'Please pick an Image',
        ),
      );
      return;
    }
    if (_repassword.trim() != _userPassword.trim() && !_isLogin) {
      Scaffold.of(context).showSnackBar(
        _showSnackBar(
          'Your Password doesn\'t match',
        ),
      );
      return;
    }
    if (_bloodGroup == null && !_isLogin) {
      Scaffold.of(context).showSnackBar(
        _showSnackBar(
          'Please select a Blood Group',
        ),
      );
      return;
    }
    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        _userName.trim(),
        _rollNumber.trim(),
        _bloodGroup,
        _isDonor,
        _userImageFile,
        _isLogin,
        context,
      );
    }
  }

  Widget _buildSelectBloodGroup(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'BLOOD GROUP : ',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 15.0,
            fontWeight: FontWeight.w700,
            color: Colors.grey,
          ),
        ),
        DropdownButton<String>(
          iconEnabledColor: Colors.indigo,
          value: _bloodGroup,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.indigo),
          underline: Container(
            height: 2,
            color: Colors.indigo,
          ),
          onChanged: (String newValue) {
            setState(() {
              _bloodGroup = newValue;
            });
          },
          items: <String>['O+', 'O-', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (_isLogin) _buildNssWidget(),
            Container(
              // padding: EdgeInsets.only(
              //     top: MediaQuery.of(context).size.height /
              //         (_isLogin ? 50 : double.infinity)),
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      if (!_isLogin) UserImagePicker(_pickedImage),
                      TextFormField(
                        key: ValueKey('email'),
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        enableSuggestions: false,
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email address.';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo))),
                        onSaved: (value) {
                          _userEmail = value;
                        },
                      ),
                      if (!_isLogin)
                        TextFormField(
                          key: ValueKey('username'),
                          autocorrect: true,
                          textCapitalization: TextCapitalization.words,
                          enableSuggestions: false,
                          validator: (value) {
                            if (value.isEmpty || value.length < 4) {
                              return 'Please enter at least 4 characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'USERNAME',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.indigo))),
                          onSaved: (value) {
                            _userName = value;
                          },
                        ),
                      if (!_isLogin)
                        TextFormField(
                          key: ValueKey('rollno'),
                          autocorrect: true,
                          textCapitalization: TextCapitalization.words,
                          enableSuggestions: false,
                          validator: (value) {
                            if (value.isEmpty || value.length < 8) {
                              return 'Please enter a valid Roll Number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'ROLL NUMBER',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.indigo))),
                          onSaved: (value) {
                            _rollNumber = value;
                          },
                        ),
                      if (!_isLogin) _buildSelectBloodGroup(context),
                      TextFormField(
                        key: ValueKey('password'),
                        validator: (value) {
                          if (value.isEmpty || value.length < 7) {
                            return 'Password must be at least 7 characters long.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo))),
                        obscureText: true,
                        onSaved: (value) {
                          _userPassword = value;
                        },
                      ),
                      // if (_isLogin)
                      //   Container(
                      //     alignment: Alignment(1.0, 0.0),
                      //     padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      //     child: InkWell(
                      //       child: Text(
                      //         'Forget Password',
                      //         style: TextStyle(
                      //             color: Colors.indigo,
                      //             fontWeight: FontWeight.bold,
                      //             fontFamily: 'Montserrat',
                      //             decoration: TextDecoration.underline),
                      //       ),
                      //     ),
                      //   ),
                      if (!_isLogin)
                        TextFormField(
                          key: ValueKey('repassword'),
                          validator: (value) {
                            if (value.isEmpty || value.length < 7) {
                              return 'Password must be at least 7 characters long.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'CONFIRM PASSWORD',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.indigo))),
                          obscureText: true,
                          onSaved: (value) {
                            _repassword = value;
                          },
                        ),
                      SizedBox(height: 40),
                      if (widget.isLoading)
                        CircularProgressIndicator(
                          backgroundColor: Colors.indigo,
                        ),
                      if (!widget.isLoading && _isLogin)
                        InkWell(
                          onTap: _trySubmit,
                          splashColor: Colors.indigo,
                          child: Container(
                            height: 50.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.indigoAccent,
                              color: Colors.indigo,
                              elevation: 7.0,
                              child: Center(
                                child: Text(
                                  'LOGIN',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (!_isLogin && !widget.isLoading)
                        Container(
                            height: 50.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.indigoAccent,
                              color: Colors.indigo,
                              elevation: 7.0,
                              child: InkWell(
                                onTap: _trySubmit,
                                child: Center(
                                  child: Text(
                                    'SIGNUP',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            )),
                      SizedBox(height: 25.0),
                      if (!_isLogin)
                        Container(
                          height: 40.0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Center(
                                child: Text('Go Back',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                              ),
                            ),
                          ),
                        ),
                      if (_isLogin)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Doesnt have an account?',
                              style: TextStyle(fontFamily: 'Montserrat'),
                            ),
                            SizedBox(width: 5.0),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.indigo,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildNssWidget() {
    var fullWidth = MediaQuery.of(context).size.width;
    var fullHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              fullWidth / 10, fullHeight / 3.2, 0.0, fullWidth / 10),
          child: FittedBox(
            child: Text('NSS  MCET',
                style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[900])),
          ),
        ),
        Container(
          padding:
              EdgeInsets.fromLTRB(fullWidth / 3.3, fullHeight / 10, 0.0, 0.0),
          child: new CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 50.0,
            child: Image.asset('assets/images/nn.png'),
          ),
        ),
      ],
    );
  }
}
