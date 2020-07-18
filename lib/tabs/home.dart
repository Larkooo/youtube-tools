import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_video_validator/youtube_video_validator.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as ytex;

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

//var url;

class _Home extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  Future<void> data(mdrr) async {
    var yt = ytex.YoutubeExplode();
    var video = await yt.videos.get(mdrr);

    //print('Title: ${video.title}');
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Downloading ${video.title}'),
      action: SnackBarAction(label: "Close", onPressed: () {}),
    ));
    // Close the YoutubeExplode's http client.
    yt.close();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 350,
                child: TextFormField(
                  validator: (value) {
                    if (!YoutubeVideoValidator.validateUrl(value)) {
                      return "Please enter a valid Youtube URL";
                    } else {
                      data(value);
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.link),
                    labelText: 'Video URL',
                  ),
                  //onChanged: (value) {
                  //  if (!value.startsWith("https://youtu")) {
                  //    print("Please enter a valid Youtube URL");
                  //  }
                  //},
                )),
            SizedBox(
              height: 10,
            ),
            OutlineButton.icon(
              label: Text("Download"),
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  //Scaffold.of(context).showSnackBar(SnackBar(
                  //  content: Text('Downloading '),
                  //  action: SnackBarAction(label: "Close", onPressed: () {}),
                  //));
                }
              },
              icon: Icon(Icons.file_download),
            ),
          ],
        ),
      ),
    );
  }
}
