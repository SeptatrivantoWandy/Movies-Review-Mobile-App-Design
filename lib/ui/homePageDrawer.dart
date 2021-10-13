import 'package:HCIProjectLab/ui/aboutUsPage.dart';
import 'package:HCIProjectLab/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class homePageDrawer extends StatelessWidget {

  String value;
  homePageDrawer({this.value});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: [
                  tfUsername(value),
                ],
              ),
            ),
          ),
          listTileHome(context),
          listTileAboutUs(context),
          listTileLogOut(context),
        ],
      ),
    );
  }
}

Widget tfUsername(String tfName) {
  return Container(
    child: Text(
      'Hello, ' + tfName,
      style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
    ),
    margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
  );
}

Widget listTileHome(context) {
  return Container(
    child: ListTile(
      leading: Icon(Icons.home_filled),
      title: Text(
        'Home',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    ),
  );
}

Widget listTileAboutUs(context) {
  return Container(
    child: ListTile(
      leading: Icon(Icons.info),
      title: Text(
        'About Us',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      onTap: () {
        Navigator.pop(context);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => aboutUsPage()));
      },
    ),
  );
}

Widget listTileLogOut(context) {
  return Container(
    child: ListTile(
      leading: Icon(Icons.logout),
      title: Text(
        'Log Out',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      onTap: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => login()),
            (Route<dynamic> route) => false);
      },
    ),
  );
}
