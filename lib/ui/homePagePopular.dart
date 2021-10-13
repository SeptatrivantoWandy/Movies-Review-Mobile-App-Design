import 'package:HCIProjectLab/model/item.dart';
import 'package:HCIProjectLab/ui/movieDetailPage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class homePagePopular extends StatefulWidget {
  

  @override
  _homePagePopularState createState() => _homePagePopularState();
}

int _counter = 0;
int _current = 0;
String value;

List<item> items = new List();

class _homePagePopularState extends State<homePagePopular> {
  @override
  Widget build(BuildContext context) {

    items.clear();
    items.add(item("assets/doraemon.jpeg", "Doraemon", "Kids", "In the suburbs of Tokyo, there lived an awkward boy about 10 years old. A person named Sewashi, a descendant of Nobita's fourth generation in the 22nd century, appears in front of him, and a guardian robot cat Doraemon in the 22nd century who helps people with his secret gadget."));
    items.add(item("assets/friend_zone.jpg", "Friend Zone", "Romance", "Palm (Naphat Nine) is stuck in the friendship zone with her best friend Gink (Pimchanok Luevisadpaibul) for 10 years. In high school, Palm tries to express his feelings but Gink rejects it. Whenever Palm breaks up with one of his countless girlfriends, Gink will advise him as a best friend. Every time Gink fights his girlfriend wherever Palm is , Myanmar, Malaysia, or Hong Kong he (Gink) will call Palm and force him to use his flight attendant allowance to board the plane accompanying Gink."));
    items.add(item("assets/mib.jpeg", "MIB", "Action", "The Men in Black have always protected the Earth from the scum of the universe. In this new adventure, they tackle their biggest threat to date: a mole in the Men in Black organization. After an eye-opening encounter of the third kind, the secret MiB organisation's newest recruit, Agent M, finds herself under the wing of the heroic Agent H in cosmopolitan London, when a shape-shifting duo of intergalactic assassins executes an alien aristocrat. Now, with a devastating super-weapon of mass destruction hidden somewhere on Earth, the Men in Black will leave no stone unturned to retrieve it. However, heavy clouds of mistrust and a scent of betrayal envelop the once-incorruptible agency. Is there a well-placed mole in their midst?"));
    items.add(item("assets/parasite.jpeg", "Parasite", "Thriller", "Ki-Taek (Song Kang-Ho) is poor and unemployed. He lives with his wife Choong-Sook (Jang Hye-Jin), son Ki-Woo (Choi Woo-Sik) and daughter Ki-Jung (Park So-Dam) in a damp, insect infested semi-basement apartment in a low income area of Seoul. When Ki-Woo takes his friend (Park Seo-Joon) to a nearby convenient store for drinks, he learns that his friend (who is going to study abroad) is leaving behind a good paying private tutoring job. His friend wants Ki-Woo to takeover the tutoring job while he is abroad. Soon, Ki-Woo enters the life of the wealthy Park family, with Ki-Woo's own family lurking in the periphery."));
    items.add(item("assets/spiderman.jpeg", "Spiderman", "Action", "Peter Parker returns in Spider-Man: Far From Home, the next chapter of the Spider-Man: Homecoming series! Our friendly neighborhood Super Hero decides to join his best friends Ned, MJ, and the rest of the gang on a European vacation. However, Peter's plan to leave super heroics behind for a few weeks are quickly scrapped when he begrudgingly agrees to help Nick Fury uncover the mystery of several elemental creature attacks, creating havoc across the continent!"));


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
    itemCount: 5,
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
            Image.asset('assets/doraemon.jpeg'),
            Image.asset('assets/friend_zone.jpg'),
            Image.asset('assets/mib.jpeg'),
            Image.asset('assets/parasite.jpeg'),
            Image.asset('assets/spiderman.jpeg'),
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