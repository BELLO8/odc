import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;
  int activePage = 1;
  List<String> images = [
    "assets/images/ORANGE-Ok.jpeg",
    "assets/images/O-digital-tour-Ayana-4.jpeg",
    "assets/images/ORANGE-Ok.jpeg"
  ];
  int _currentIndex = 0;

  final List<String> titles = [
    ' Bilan RSE 2020 ',
    ' Orange digital academie ',
    ' fab labs ',
  ];

  final List<String> desc = [
    'Présentation du Bilan RSE 2020 : le Cluster Orange Côte d’Ivoire annonce un centre d’excellence pour la lutte contre les maladies cardiovasculaires et l’hypertension artérielle ',
    'Académie d\'élite, rejoins-nous pour révéler ton talent par des formations pratiques et avancées sur le digital et les nouvelles innovations technologiques.',
    'Agir pour l’avenir des jeunes, c’est leur donner l’opportunité de se réinventer grâce aux nouvelles technologies. ',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index
                ? Color.fromARGB(255, 232, 102, 51)
                : Color.fromARGB(66, 236, 235, 235),
            shape: BoxShape.circle),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 2, 49, 2)),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 8, 8, 8),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 2),
            child: Align(
              child: Image.asset("assets/images/orange1.png", height: 35),
            ),
          ),
          SizedBox(width: 196),
          Column(
            children: [
              SizedBox(height: 8, width: 12),
              TextButton(
                onPressed: () {},
                child: Text("Se connecter",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              )
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(),
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 550.0,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _currentIndex = index;
                    },
                  );
                },
              ),
              items: images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Image.asset('$i'),
                        Container(
                          height: 240.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 19, 19, 19)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 12,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '${titles[_currentIndex]}',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFF6600),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8, width: 28),
                              Text(
                                '${desc[_currentIndex]}',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: OutlinedButton(
                                  child: Text('DECOUVRIR'),
                                  style: OutlinedButton.styleFrom(
                                    primary: Colors.white,
                                    side: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        width: 2),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Color.fromARGB(255, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: indicators(images.length, _currentIndex),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
