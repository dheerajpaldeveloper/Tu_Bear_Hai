import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tu_bear_hai/screens/beers_detail_screen.dart';
import 'package:tu_bear_hai/viewmodels/beers_view_model.dart';

class NewsGrid extends StatelessWidget {
  final List<BeersViewModel> beers;

  NewsGrid({this.beers});

  void _showNewsArticleDetails(BuildContext context, BeersViewModel vm) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return BeersDetailScreen(
        beersViewModel: vm,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: this.beers.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? 2
                  : 4),
      itemBuilder: (BuildContext _, int index) {
        final article = this.beers[index];

        return GestureDetector(
          onLongPress: () {
            _showNewsArticleDetails(context, article);
          },
          child: GridTile(
            child: Container(
              decoration: BoxDecoration(
                color: Color(Random().nextInt(0xffffff)).withAlpha(0xff),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigoAccent.withOpacity(0.8),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(4, 4), // changes position of shadow
                  ),
                ],
              ),

              // color: Color(Random().nextInt(0xffffff)).withAlpha(0xff),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Image.network(article.imageUrl),

              // CircleImage(
              //   imageUrl: article.imageUrl,
              // ),
            ),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: Container(
                child: Text(
                  article.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  maxLines: 1,
                  //overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
