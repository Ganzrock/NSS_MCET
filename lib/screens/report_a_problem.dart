import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/user_details.dart';
import 'package:flutter_complete_guide/widgets/constants.dart';
import 'package:flutter_complete_guide/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class ReportProblemScreen extends StatelessWidget {
  static const routeName = '/report-problems';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    var _message = '';

    Future<void> _showDialog(String content) async {
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) => SimpleDialog(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 10.0),
                Text('Please wait')
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('FeedBack', style: theme.textTheme.headline1),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios, color: Colors.indigo),
      //     color: Colors.black,
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 70.0),
                    TextField(
                      key: ValueKey('content'),
                      style: TextStyle(
                        height: 0.8,
                        color: Colors.indigo[600],
                      ),
                      minLines: 25,
                      maxLines: 100,
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'Write Your Feedback / Message here',
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
                        _message = value;
                      },
                    ),
                    SizedBox(height: 20.0),
                    MaterialButton(
                      color: Colors.indigo,
                      child: Text(
                        'Send',
                        style: TextStyle(
                          fontFamily: 'MontSerrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        if (_message.length > 0) {
                          _showDialog('Please Wait...');
                          await Provider.of<UserData>(context, listen: false)
                              .sendFeedback(_message)
                              .then((value) {
                            // _showDialog(
                            //     'Sent Successfully. Thank You for your Interest :)');
                            Navigator.of(context).pop();
                            _message = '';
                          });
                        }
                      },
                    ),
                    SizedBox(height: 20.0),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: width * 0.25,
                            height: width * 0.25,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.elliptical(
                                  width * 0.3,
                                  width * 0.125,
                                ),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    content: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                            'Send a negative feedback :(')),
                                    actions: [
                                      FlatButton(
                                        child: Text(
                                          'NO',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                      FlatButton(
                                          child: Text(
                                            'YES',
                                            style:
                                                TextStyle(color: Colors.indigo),
                                          ),
                                          onPressed: () async {
                                            await Firestore.instance
                                                .collection('feedback')
                                                .document('negativeFeedback' +
                                                    DateTime.now().toString())
                                                .setData({
                                              '1': 'negative'
                                            }).then((value) =>
                                                    Navigator.of(context)
                                                        .pop());
                                          })
                                    ],
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 20.0,
                                margin: EdgeInsets.all(15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(80.0),
                                  ),
                                ),
                                child: Container(
                                  child: Image.asset('assets/sad.png'),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.25,
                            height: width * 0.25,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              shape: BoxShape.circle,
                            ),
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    content: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child:
                                            Text('Send a neutral feedback :)')),
                                    actions: [
                                      FlatButton(
                                        child: Text(
                                          'NO',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                      FlatButton(
                                          child: Text(
                                            'YES',
                                            style:
                                                TextStyle(color: Colors.indigo),
                                          ),
                                          onPressed: () async {
                                            await Firestore.instance
                                                .collection('feedback')
                                                .document('nuetralFeedback' +
                                                    DateTime.now().toString())
                                                .setData({
                                              '1': 'negative'
                                            }).then((value) =>
                                                    Navigator.of(context)
                                                        .pop());
                                          })
                                    ],
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 20.0,
                                margin: EdgeInsets.all(15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(80.0),
                                  ),
                                ),
                                child: Container(
                                  child: Image.asset('assets/smile.png'),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.25,
                            height: width * 0.25,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.elliptical(
                                    width * 0.3, width * 0.125),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    content: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                            'Send a Possitive feedback :D')),
                                    actions: [
                                      FlatButton(
                                        child: Text(
                                          'NO',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                      FlatButton(
                                          child: Text(
                                            'YES',
                                            style:
                                                TextStyle(color: Colors.indigo),
                                          ),
                                          onPressed: () async {
                                            await Firestore.instance
                                                .collection('feedback')
                                                .document('possitiveFeedback' +
                                                    DateTime.now().toString())
                                                .setData({
                                              '1': 'Possitive'
                                            }).then((value) =>
                                                    Navigator.of(context)
                                                        .pop());
                                          })
                                    ],
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 20.0,
                                margin: EdgeInsets.all(15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(80.0),
                                  ),
                                ),
                                child: Container(
                                  child: Image.asset('assets/smile_big.png'),
                                ),
                              ),
                            ),
                          ),
                        ])
                  ],
                ),
              ),
              CustomAppBar(
                title: 'FeebBack  :)',
                backButton: true,
                showNotify: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
