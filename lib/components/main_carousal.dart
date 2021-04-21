import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../author_page.dart';
import '../details_page.dart';

class MainCarousal extends StatefulWidget {
  final List images;
  final Function(int index, CarouselPageChangedReason changePhrase)
      onPageChanged;
  MainCarousal({Key key, this.images, this.onPageChanged}) : super(key: key);

  @override
  _MainCarousalState createState() => _MainCarousalState();
}

class _MainCarousalState extends State<MainCarousal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
          items: widget.images.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DetailsPage(
                                  tag: i,
                                  image: i,
                                )));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 20,
                          color: Colors.grey.shade200)
                    ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                          child: Row(
                            children: [
                              Text(
                                "15 people liked this",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.favorite_outline,
                                size: 14,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Hero(
                                tag: i,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  // margin: EdgeInsets.symmetric(horizontal: 5.0),

                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(i),
                                        fit: BoxFit.cover),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomRight,
                                          colors: [
                                            Colors.black.withOpacity(.8),
                                            Colors.black.withOpacity(.0)
                                          ]),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AuthorPage(
                                                  image: i,
                                                )));
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration:
                                        BoxDecoration(color: Colors.black),
                                    child: Center(
                                      child: SvgPicture.asset(
                                          "assets/svg/foward_nav_white.svg"),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Acconci",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "05 May 2021",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: 10,
                                child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: SizedBox(
                                          height: 2,
                                          width: 20,
                                          child: Divider(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Cheers",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Icon(Icons.linear_scale),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            // height: 400,
            aspectRatio: 1.6 / 2,
            viewportFraction: 0.78,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            //   autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: widget.onPageChanged,
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}
