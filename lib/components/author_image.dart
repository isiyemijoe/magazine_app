import 'package:flutter/material.dart';

class AuthorImage extends StatelessWidget {
  const AuthorImage({
    Key key,
    this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.70,
            width: MediaQuery.of(context).size.width * 0.70,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.65,
                  width: MediaQuery.of(context).size.width * 0.65,
                  color: Colors.black,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Hero(
                    tag: image,
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.60,
                      width: MediaQuery.of(context).size.width * 0.60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover, image: AssetImage(image))),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Icon(
            Icons.maximize,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
