import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:today_quotes/model/quote_model.dart';
import 'package:today_quotes/widgets/LikedQuotesPage.dart';
import 'package:share/share.dart';

class quote_w extends StatefulWidget {
  var quote = "";
  var auther = "";
  final onsharclick;
  var onlikeclick;
  var onNextClick;
  var onPrClick;

  quote_w({
    required this.quote,
    required this.auther,
    this.onsharclick,
    this.onlikeclick,
    this.onPrClick,
    this.onNextClick,
  });

  @override
  State<quote_w> createState() => _quote_wState();
}

class _quote_wState extends State<quote_w> {
  bool islike = false;
  List<quotemodel> likedQuote = [];
  quotemodel qe = quotemodel();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 233, 116, 253),
            Color.fromARGB(255, 80, 192, 240)
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Icon(Icons.format_quote_sharp, size: 60),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.quote,
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            widget.auther,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.black)),
                  child: IconButton(
                    icon: Icon(
                      islike ? Icons.favorite : Icons.favorite_border,
                      size: 30,
                      color: islike ? Colors.pink : Colors.black,
                    ),
                      onPressed: () {
                      setState(() {
                        islike = !islike;
                        if (islike) {
                          likedQuote.add(quotemodel(
                              text: widget.quote, author: widget.auther));
                        }
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.black)),
                  child: IconButton(
                    icon: Icon(
                      Icons.share,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      onsharclick();
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LikedQuotesPage(likedQuote: likedQuote),
                ),
              );
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 20.0,
                      spreadRadius: 0.0),
                ],
              ),
              child: Center(
                child: Text(
                  "watch like quotes",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onsharclick() {
    Share.share(
      "Quote of the day:\n${widget.quote}\n- ${widget.auther}",
      subject: "Quote of the day",
    );
  }
}
