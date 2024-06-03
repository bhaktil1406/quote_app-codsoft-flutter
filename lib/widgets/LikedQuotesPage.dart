import 'package:flutter/material.dart';
import 'package:today_quotes/model/quote_model.dart';

class LikedQuotesPage extends StatelessWidget {
  final List<quotemodel> likedQuote;

  LikedQuotesPage({required this.likedQuote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Liked Quote',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
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
          child: ListView.builder(
              itemCount: likedQuote.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(likedQuote[index].text ?? ''),
                  subtitle: Text(likedQuote[index].author ?? ''),
                );
              }),
        ));
  }
}
