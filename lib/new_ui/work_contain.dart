import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class WorkCont extends StatefulWidget {
  @override
  _WorkContState createState() => _WorkContState();
}

class _WorkContState extends State<WorkCont> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, left: 10.0, right: 10.0, bottom: 5.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.lightBlueAccent,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: gradientColor.last.withOpacity(0.4),
          //     blurRadius: 8,
          //     spreadRadius: 2,
          //     offset: Offset(4, 4),
          //   ),
          // ],
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Running",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
                LikeButton(
                  size: 30.0,
                  circleColor: CircleColor(
                      start: Color(0xff00ddff), end: Color(0xff0099cc)),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Color(0xff33b5e5),
                    dotSecondaryColor: Color(0xff0099cc),
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      isLiked ? Icons.star : Icons.star_border,
                      color: isLiked ? Colors.yellow : Colors.white,
                      size: 30.0,
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 2.0,
                right: 50.0,
                bottom: 10.0,
              ),
              child: Text(
                'Running can give you a longer life, better sleep, improved immunity.',
                style: TextStyle(color: Colors.white, fontFamily: 'avenir'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Beginner",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'avenir',
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      constraints: BoxConstraints(
                        minWidth: 30.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('TRY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
