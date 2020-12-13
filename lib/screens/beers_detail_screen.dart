import 'dart:math';

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:tu_bear_hai/viewmodels/beers_view_model.dart';

import 'bottom_sheet_screen.dart';

class BeersDetailScreen extends StatelessWidget {
  final BeersViewModel beersViewModel;

  BeersDetailScreen({@required this.beersViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: 150,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Tu Bear Hai',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  // Text(
                  //   this.article.name ?? 'Undefined',
                  //   overflow: TextOverflow.ellipsis,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Divider(
                      height: 40,
                      color: Colors.blueAccent,
                      thickness: 30,
                    ),
                    Text(
                      ' Description of product',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  this.beersViewModel.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    wordSpacing: 2,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onLongPress: () {
                    //share on whatsapp
                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(Random().nextInt(0xffffff)).withAlpha(0xff),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.indigoAccent.withOpacity(0.8),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(4, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 280,
                    child: Image.network(
                      beersViewModel.imageUrl,
                    ),
                  ),
                ),
                Center(
                  child: OutlinedButton.icon(
                    icon: Icon(Icons.share),
                    label: Text("Share On What's App"),
                    onPressed: () => _onShareWithEmptyOrigin(context),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 2.0, color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "TagLine :-",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        wordSpacing: 2,
                      ),
                    ),
                    Text(
                      this.beersViewModel.tagline ?? "No Contents",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        wordSpacing: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Description:- ",
                  style: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 2,
                  ),
                ),
                Text(
                  this.beersViewModel.description ?? "No Contents",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: BottomSheetExample(
                  beersViewModel: beersViewModel,
                ),
              ),
            ),
          );
        },
        tooltip: 'See Full Details',
        child: Icon(Icons.more),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _onShareWithEmptyOrigin(BuildContext context) async {
    await Share.share(this.beersViewModel.imageUrl +
        " " +
        this.beersViewModel.name +
        " " +
        this.beersViewModel.description);
  }
}
