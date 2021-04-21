import 'package:flutter/material.dart';
import 'package:magazine_app/animations/slidein_right_animations.dart';
import 'package:magazine_app/constants.dart';

class DetailsPage extends StatefulWidget {
  final String image;
  final String tag;

  const DetailsPage({Key key, this.image, this.tag}) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var _controller;
  var _isCollapsed = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset > 220 && !_controller.position.outOfRange) {
        if (!_isCollapsed) {
          // do what ever you want when silver is collapsing !

          //   myTitle = "silver collapsed !";
          _isCollapsed = true;
          setState(() {});
        }
      }
      if (_controller.offset <= 220 && !_controller.position.outOfRange) {
        if (_isCollapsed) {
          // do what ever you want when silver is expanding !

          _isCollapsed = false;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          controller: _controller,
          slivers: [
            SliverAppBar(
              leading: BackButton(
                color: Colors.black,
              ),
              pinned: true,
              centerTitle: false,
              title: _isCollapsed
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shadow-Play",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Acconci",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    )
                  : null,
              backgroundColor: Colors.white,
              expandedHeight: MediaQuery.of(context).size.height * 0.30,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                double anim = (constraints.maxHeight /
                    (MediaQuery.of(context).size.height * 0.30));
                // setAnim(anim);
                return FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  title: Column(
                    children: [],
                  ),
                  background: Hero(
                    tag: widget.tag,
                    child: Material(
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(widget.image),
                              fit: BoxFit.cover,
                            )),
                          ),
                          Positioned(
                            top: 50,
                            right: 10,
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Row(
                                children: [
                                  Text(
                                    "Cheers",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: SizedBox(
                                      height: 2,
                                      width: 70,
                                      child: Divider(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              top: MediaQuery.of(context).size.height * 0.22,
                              left: MediaQuery.of(context).size.width * 0.20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SlideInRightAnimation(
                                    delay: 0.5,
                                    child: Text(
                                      "Acconci",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SlideInRightAnimation(
                                    delay: 0.5,
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      height: 113,
                                      color: Colors.white,
                                      width: MediaQuery.of(context).size.width *
                                          0.80,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0.0, left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Excerpts",
                                              style: TextStyle(
                                                color: Colors.black54,
                                              ),
                                            ),
                                            Text(
                                              "Shadow -Play",
                                              style: TextStyle(
                                                  fontFamily: "OldStandard",
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            SliverList(
                delegate: SliverChildListDelegate(
              [
                SlideInRightAnimation(
                  delay: 1,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    padding: EdgeInsets.fromLTRB(
                        _isCollapsed
                            ? 20
                            : MediaQuery.of(context).size.width * 0.20,
                        15,
                        20,
                        20),
                    child: Text(
                      detailsText,
                      style: TextStyle(
                          wordSpacing: 5,
                          letterSpacing: 0.5,
                          fontSize: 16,
                          fontFamily: "OldStandard",
                          fontWeight: FontWeight.w400),
                      maxLines: null,
                    ),
                  ),
                ),
              ],
            ))
          ],
        ));
  }
}

// Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//           ),
//           Hero(
//             tag: widget.tag,
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.40,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                 image: AssetImage(widget.image),
//                 fit: BoxFit.cover,
//               )),
//             ),
//           ),
//           Positioned(
//               top: 20,
//               left: 10,
//               child: BackButton(
//                 color: Colors.white,
//               )),
//           Positioned(
//             top: 100,
//             right: 10,
//             child: RotatedBox(
//               quarterTurns: 1,
//               child: Row(
//           children: [
//             Text(
//               "Cheers",
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 16,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 8.0),
//               child: SizedBox(
//                 height: 2,
//                 width: 70,
//                 child: Divider(
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//     Positioned(
//       top: MediaQuery.of(context).size.height * 0.25,
//       right: 0,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Acconci",
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 40,
//                 fontWeight: FontWeight.w600),
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width * 0.80,
//             padding: EdgeInsets.all(20),
//             color: Colors.white,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10.0),
//                   child: Text(
//                     "Excerpts",
//                     style: TextStyle(
//                       color: Colors.black54,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Center(
//                     child: Text(
//                   "Shadow -Play",
//                   style: TextStyle(
//                       fontSize: 30, fontWeight: FontWeight.bold),
//                 )),
//                 SingleChildScrollView(
//                   child: Text(
//                     detailsText,
//                     maxLines: null,
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     )
//   ],
// ),
