import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/user_details.dart';
import 'package:provider/provider.dart';

class ReportProblemScreen extends StatelessWidget {
  static const routeName = '/report-problems';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var _message = '';
    return Scaffold(
      appBar: AppBar(
        title: Text('FeedBack', style: theme.textTheme.headline1),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.indigo),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20.0),
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
              FlatButton(
                child: Text('Send'),
                onPressed: () async {
                  showDialog(
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
                  await Provider.of<UserData>(context, listen: false)
                      .sendFeedback(_message)
                      .then((value) {
                    Navigator.of(context).pop();
                    _message = '';
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
