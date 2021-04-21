import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:magazine_app/animations/bottom_up_animations.dart';
import 'package:magazine_app/animations/fade_in_animatons.dart';
import 'package:magazine_app/animations/slide_left_animation.dart';
import 'package:magazine_app/animations/slidein_right_animations.dart';
import 'package:magazine_app/constants.dart';

import 'components/author_image.dart';

class AuthorPage extends StatefulWidget {
  final String image;

  AuthorPage({Key key, this.image}) : super(key: key);

  @override
  AuthorPageState createState() => AuthorPageState();
}

class AuthorPageState extends State<AuthorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset("assets/svg/back_nav_black.svg")),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SlideInLeftAnimation(
                          delay: 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lygia Pape",
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Divisor",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                "1960",
                                style: TextStyle(
                                    fontFamily: "Bungee",
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        SlideInRightAnimation(
                          delay: 0.5,
                          child: Container(
                            //     height: 100,
                            color: Colors.black,
                            width: 100,
                            child: Column(
                              children: [
                                Spacer(
                                  flex: 4,
                                ),
                                Text(
                                  "12",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                Text(
                                  "/07",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(
                                  flex: 4,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                FadeInAnimations(
                  delay: 1,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Text(
                        summary,
                        style:
                            TextStyle(fontFamily: "OldStandard", fontSize: 16),
                      )),
                ),
                AuthorImage(
                  image: widget.image,
                ),
                BottomUpAnimaitons(
                  delay: 0.3,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Text(
                        detailsText,
                        style:
                            TextStyle(fontFamily: "OldStandard", fontSize: 16),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
