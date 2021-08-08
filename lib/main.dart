import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:magazine_app/details_page.dart';
import 'package:magazine_app/components/main_carousal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Cinzel",
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<String> images = [
    "assets/images/one.jpg",
    "assets/images/two.jpg",
    "assets/images/three.jpg",
    "assets/images/four.jpg",
    "assets/images/five.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svg/menu_icon.svg")),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(widget.title,style: TextStyle(
          color: Colors.black
        ),),
        actions: [
          IconButton(
              icon: FaIcon(FontAwesomeIcons.search, color: Colors.black),
              onPressed: () {})
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Text(
              "Magazine",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          MainCarousal(
            onPageChanged: onPageChanges,
            images: images,
          )
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        showUnselectedLabels: false,
        onTap: (_) {
          setState(() {
            _selectedIndex = _;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.compass), label: "Explore"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.userAlt), label: "user"),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  onPageChanges(int index, CarouselPageChangedReason phrase) {}
}
