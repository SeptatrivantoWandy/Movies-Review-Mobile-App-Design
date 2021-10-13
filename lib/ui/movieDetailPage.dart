import 'package:HCIProjectLab/ui/homePageNewMovies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


final _formkey = GlobalKey<FormState>();

class movieDetailPage extends StatelessWidget {


  String image;
  String title;
  String genre;
  String description;

  movieDetailPage({this.image, this.title, this.genre, this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Movie Detail'),
      ),
      body: Builder(builder: (context){
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formkey,
              child: ListView(
                shrinkWrap: true,
                // padding: EdgeInsets.all(32),
                children: <Widget>[
                  imageDetail(image),
                  titleGenreDetail(title, genre),
                  synopsisDetail(description),
                  reviewMovieDetail(context),
                  btnSubmit(context),
                ],
              ),
            ),
          );
        }),
    );
  }
}

Widget imageDetail(String image){
  return Container(
    alignment: Alignment.center,
    child: Image.asset(
      image,
      width: 240,
      height: 240,
    )
  );
}

Widget titleGenreDetail(String title, String genre){
  return Container(
    child: Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          genre,
          style: TextStyle(
            fontSize: 15,
          ),
        )
      ],
    ),
    margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
  );
}

Widget synopsisDetail(String synopsis){
  return Container(
    height: 130.0,
    child: ListView(
      shrinkWrap: true,
      // padding: EdgeInsets.all(32),
      children: <Widget>[
        Text(
          synopsis,
          textAlign: TextAlign.justify,
        ),
      ],
    ),
    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
  );
}

Widget reviewMovieDetail(context){
  return Container(
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Write review here",
        border: OutlineInputBorder(),
      ),
      validator: (value){
        if (value.length > 1000) {
          return _showMessageDialog(context);
        }
      },
      maxLines: 5,
    ),
    margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
  );
}

Widget btnSubmit(context){
  return Container(
    child: RaisedButton(
      onPressed: (){
        if(!_formkey.currentState.validate()){
          return;
        } else {
          
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Text(
              'SUBMIT',
              textAlign: TextAlign.center,
            )
          ],
        )
      ),
    ),
    margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
  );
}

_showMessageDialog(BuildContext context) => showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: Text('Notification!'),
    content: Text('review content must not more than 1000 characters'),
    actions: [
      FlatButton(
        onPressed: () => Navigator.of(context).pop(), 
        child: Text('OK')
      )
    ],
  )
);

// AlertDialog(
//   title: Text('Notification!'),
//   content: Text('username length must not more that 1000 characters'),
//   actions: [
//     FlatButton('OK'),
//   ]
// );