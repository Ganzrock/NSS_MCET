import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginForm extends StatefulWidget {
  LoginForm();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var userEmail;
  var password;

  final _auth = FirebaseAuth.instance;

  FirebaseAuth authResult;

  void loginUserWithEmailAndPassword(
      BuildContext ctx, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    var dHeight = MediaQuery.of(context).size.height;
    return Column(children: <Widget>[
      TextFormField(
        key: ValueKey('email'),
        autocorrect: false,
        textCapitalization: TextCapitalization.none,
        enableSuggestions: false,
        validator: (value) {
          if (value.isEmpty || !value.contains('@')) {
            return 'Please Enter a Valid Email Address';
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.indigo))),
        onChanged: (value) {
          userEmail = value;
        },
      ),
      SizedBox(
        height: dHeight * 0.02,
      ),
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
          password = value;
        },
      ),
      SizedBox(
        height: dHeight * 0.072,
      ),
      Container(
        height: 50.0,
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.indigoAccent,
          color: Colors.indigo,
          elevation: 7.0,
          child: GestureDetector(
            onTap: () => loginUserWithEmailAndPassword,
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
      SizedBox(
        height: dHeight * 0.04,
      ),
      GestureDetector(
        onTap: () => loginUserWithEmailAndPassword,
        child: Container(
          height: 40.0,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, style: BorderStyle.solid, width: 1.0),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: ImageIcon(
                  AssetImage('assets/images/google.png'),
                  size: 40.0,
                )),
                SizedBox(width: 10.0),
                Center(
                  child: Text(
                    'Login in With Google',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      SizedBox(height: dHeight * 0.028),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Doesnt have an account?',
            style: TextStyle(fontFamily: 'Montserrat'),
          ),
          SizedBox(width: 5.0),
          InkWell(
            onTap: () {},
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
    ]);
  }
}
