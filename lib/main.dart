import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

void main() {
  runApp(FloatingActionButtons());
}

class FloatingActionButtons extends StatefulWidget {
  @override
  _FloatingActionButtonsState createState() => _FloatingActionButtonsState();
}

class _FloatingActionButtonsState extends State<FloatingActionButtons> {
  final int _likeCount = 999;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Like buttons"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: LikeButton(
                size: 40,
                likeCount: _likeCount,
                countBuilder: (int count, bool isLiked, String text) {
                  var color = isLiked ? Colors.pinkAccent : Colors.grey;
                  Widget result;
                  if (count == 0) {
                    result = Text(
                      "love",
                      style: TextStyle(color: color),
                    );
                  } else
                    result = Text(
                      count >= 1000
                          ? (count / 1000.0).toStringAsFixed(1) + "k"
                          : text,
                      style: TextStyle(color: color),
                    );
                  return result;
                },
                likeCountAnimationType: _likeCount < 1000
                    ? LikeCountAnimationType.part
                    : LikeCountAnimationType.none,
                likeCountPadding: EdgeInsets.only(left: 15.0),
                onTap: onLikeButtonTapped,
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: LikeButton(
                size: 40,
                circleColor: CircleColor(
                    start: Colors.pinkAccent[200], end: Colors.pinkAccent[400]),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: Colors.lightBlue[300],
                  dotSecondaryColor: Colors.lightBlue[200],
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.insert_emoticon,
                    color: isLiked ? Colors.lightBlueAccent : Colors.grey,
                    size: 40,
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            LikeButton(
              size: 40,
              isLiked: null,
              circleColor: CircleColor(
                start: Colors.grey[200],
                end: Colors.grey[400],
              ),
              bubblesColor: BubblesColor(
                dotPrimaryColor: Colors.grey[600],
                dotSecondaryColor: Colors.grey[200],
              ),
              likeBuilder: (bool isLiked) {
                return Icon(
                  Icons.cloud,
                  color: isLiked ? Colors.grey[900] : Colors.grey,
                  size: 40,
                );
              },
              likeCount: 100,
              countPostion: CountPostion.left,
              countBuilder: (int count, bool isLiked, String text) {
                var color = Colors.grey;
                Widget result;
                if (count == 0) {
                  result = Text(
                    "love",
                    style: TextStyle(color: color),
                  );
                } else
                  result = Text(
                    text,
                    style: TextStyle(color: color),
                  );
                return result;
              },
              likeCountPadding: EdgeInsets.only(right: 15.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            LikeButton(
              size: 40,
              isLiked: null,
              circleColor: CircleColor(
                start: Colors.indigoAccent[200],
                end: Colors.indigoAccent[400],
              ),
              bubblesColor: BubblesColor(
                dotPrimaryColor: Colors.indigoAccent[700],
                dotSecondaryColor: Colors.indigoAccent[200],
              ),
              likeBuilder: (bool isLiked) {
                return Icon(
                  Icons.access_alarm,
                  color: isLiked ? Colors.indigoAccent[700] : Colors.grey,
                  size: 30,
                );
              },
              likeCount: 100,
              countPostion: CountPostion.bottom,
              countBuilder: (int count, bool isLiked, String text) {
                var color = Colors.grey;
                Widget result;

                result = Text(
                  text,
                  style: TextStyle(color: color),
                );
                return result;
              },
              likeCountPadding: EdgeInsets.only(top: 15.0),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    return !isLiked;
  }
}
