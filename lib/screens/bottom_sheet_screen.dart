import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tu_bear_hai/viewmodels/beers_view_model.dart';

class BottomSheetExample extends StatelessWidget {
  final BeersViewModel beersViewModel;

  BottomSheetExample({@required this.beersViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Complimenting food items',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blue,
              ),
            ),
            Text(
              "1. " + this.beersViewModel.food_pairing[0],
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            Text(
              "2. " + this.beersViewModel.food_pairing[1],
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            Text(
              "3. " + this.beersViewModel.food_pairing[2],
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            Text(
              'Ph Value : ' + this.beersViewModel.ph,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.blue,
              ),
            ),
            Text(
              'First_ brew : ' + this.beersViewModel.first_brewed,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.blue,
              ),
            ),
            Text(
              'Abv : ' + this.beersViewModel.abv,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.blue,
              ),
            ),
            Text(
              'Ibu : ' + this.beersViewModel.ibu,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.blue,
              ),
            ),
            Text(
              'attenuation_level : ' + this.beersViewModel.attenuation_level,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.blue,
              ),
            ),
            Text(
              'target_fg : ' + this.beersViewModel.target_fg,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.blue,
              ),
            ),
            Text(
              'target_og : ' + this.beersViewModel.target_og,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.blue,
              ),
            ),
            Text(
              'ebc : ' + this.beersViewModel.ebc,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.blue,
              ),
            ),
            Text(
              'srm : ' + this.beersViewModel.srm,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.blue,
              ),
            ),
            Column(
              children: [
                Text(
                  'Tips : ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  this.beersViewModel.brewers_tips,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            FlatButton(
              child: Text(
                'Close',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
