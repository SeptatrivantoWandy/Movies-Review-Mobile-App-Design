import 'package:flutter/material.dart';

class aboutUsPage extends StatefulWidget {
  @override
  _aboutUsPageState createState() => _aboutUsPageState();
}

class _aboutUsPageState extends State<aboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('About Us'),
        ),
        body: Builder(builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              // key: _formkey,
              child: Column(
                children: <Widget>[
                  logoEditedAsset(),
                ],
              ),
            ),
          );
        })
    );
  }
}

class logoEditedAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('assets/logoEdited.png');
    Image image = Image(image: assetImage);
    return Container(
      child: Column(
        children: [
          image,
          Text(
            'Bj Movie is an application that can tell you about the latest and the most popular movies today, this application can help you find the best film for you to watch right now.',
            style: TextStyle(
              fontSize: 18
            ),
            textAlign: TextAlign.justify,
          )
        ],
      ),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 36),
    );
  }
}