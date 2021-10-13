import 'package:HCIProjectLab/model/item.dart';
import 'package:HCIProjectLab/ui/movieDetailPage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';


class homePageNewMovies extends StatefulWidget {
  @override
  _homePageNewMoviesState createState() => _homePageNewMoviesState();
}

int _counter = 0;
int _current = 0;
String value;

List<item> items = new List();

class _homePageNewMoviesState extends State<homePageNewMovies> {
  @override
  Widget build(BuildContext context) {

    items.clear();
    items.add(item("assets/alladin.jpg", "Alladin", "Fantasy", "Aladdin, a street child who falls in love with a daughter. With differences in caste and property, Aladdin also tried to find a way to become a prince, unexpectedly he found a lamp with a genie in it. Aladdin also uses the lamp to transform himself into a prince to win Princess Jasmine's heart, but the evil vizier also pursues the lamp to rule the kingdom."));
    items.add(item("assets/angelhasfallen.jpeg", "Angel Has Fallen", "Action", "After the attempted assassination of the US President. Secret agent Mike Banning (Gerard Butler) is now the main suspect. Not accepting, Mike ran away and tried to uncover the party who had framed him."));
    items.add(item("assets/avenger.jpg", "Avenger", "Action", "Continuing Avengers Infinity War, where the incident after Thanos managed to get all the infinity stones and destroy 50% of all living things in the universe. Will the Avengers succeed in defeating Thanos?"));
    items.add(item("assets/c_marvel.jpg", "Captain Marvel", "Action", "Captain Marvel is a female superhero from Marvel who has as many powers as Superman. The superhero named Carol Danvers was originally a space pilot, it is said that he got his superpowers from an alien nation"));

    return Scaffold(
      body: Builder(builder: (context){
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              _imageCarousel(),
              Expanded(
                child: _ListImage(context),
              )
            ],
          ),
        );
      }),
    );
  }
}

Widget _ListImage(context){
  double width = MediaQuery.of(context).size.width * 0.6;
  return ListView.builder(
    itemCount: 4,
    itemBuilder: (context, index){
      return Card(
        child: InkWell(
        onTap: (){
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context) => movieDetailPage(
                image: items.elementAt(index).image,
                title: items.elementAt(index).title,
                genre: items.elementAt(index).genre,
                description: items.elementAt(index).description,
              )
            )
          );
        },
        child: Row(
          children: <Widget>[
            Flexible(
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset(
                  items.elementAt(index).image
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      items.elementAt(index).title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: width,
                      child: Text(
                        items.elementAt(index).genre
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ),
      );
    }
  );
}

Widget _imageCarousel(){
  return Container(
        child: CarouselSlider(
          items: <Widget>[
            Image.asset('assets/alladin.jpg'),
            Image.asset('assets/angelhasfallen.jpeg'),
            Image.asset('assets/avenger.jpg'),
            Image.asset('assets/c_marvel.jpg'),
            
          ],
          options: CarouselOptions(
            viewportFraction: 0.8,
            aspectRatio: 16 / 9,
            autoPlay: true,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(
              seconds: 5,
            ),
            autoPlayAnimationDuration: Duration(
              milliseconds: 800
            ),
            // autoPlayCurve: Curves.bounceIn
          )
        ),
    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
  );
}
