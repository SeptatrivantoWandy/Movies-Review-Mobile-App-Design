import 'package:HCIProjectLab/ui/homePageDrawer.dart';
import 'package:HCIProjectLab/ui/homePageNewMovies.dart';
import 'package:HCIProjectLab/ui/homePagePopular.dart';
import 'package:flutter/material.dart';




class tabbedLayout extends StatelessWidget {

  String value;
  tabbedLayout({this.value});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'New Movies',
              ),
              Tab(
                text: 'Most Popular',
              ),
            ],
          ),
        ),
        drawer: homePageDrawer(value : value),
        body: TabBarView(
          children: <Widget>[
            homePageNewMovies(),
            homePagePopular(),
          ],
        ),
      ),
      length: 2,
      initialIndex: 0,
    );
  }
}
