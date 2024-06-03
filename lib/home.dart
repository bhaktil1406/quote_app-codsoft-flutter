import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share/share.dart';
import 'package:today_quotes/widgets/quote_widget.dart';
import 'package:http/http.dart' as http;

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var apiURL = "https://type.fit/api/quotes";
  PageController controller = PageController();

  Future<List<dynamic>> getPost() async {
    final response = await http.get(Uri.parse('$apiURL'));
    return postFromJson(response.body);
  }

  List<dynamic> postFromJson(String str) {
    List<dynamic> jsonData = json.decode(str);
    jsonData.shuffle();
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
          future: getPost(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return ErrorWidget(snapshot.hasError);
              }
              return Stack(
                children: [
                  PageView.builder(
                      controller: controller,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var model = snapshot.data?[index];
                        return quote_w(
                          quote: model["text"].toString(),
                          auther: model["author"].toString(),
                          onPrClick: () {},
                          onNextClick: () {
                            controller.nextPage(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.easeIn);
                          },

                          onsharclick: (),
                          // onlikeclick: () {
                          //   Icon(
                          //     Icons.favorite_rounded,
                          //     color: Colors.pink,
                          //     size: 30,
                          //   );

                          //   print("done");
                          // },
                        );
                      }),
                ],
              );
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
