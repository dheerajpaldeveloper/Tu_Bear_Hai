import 'package:flutter/material.dart';
import 'package:tu_bear_hai/models/beers_model.dart';
import 'package:tu_bear_hai/services/web_service.dart';
import 'package:tu_bear_hai/viewmodels/beers_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class BeersListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<BeersViewModel> beers = List<BeersViewModel>();

  void topBeersShortedByYears(String year) async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();

    List<BeersModel> BeersList = await WebService().fetchBeersByyears(year);

    this.beers = BeersList.map((res) => BeersViewModel(beers: res)).toList();

    if (this.beers.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }

  void topBeers() async {
    List<BeersModel> beers = await WebService().fetchTopBeers();
    notifyListeners();
    this.beers = beers.map((res) => BeersViewModel(beers: res)).toList();
    if (this.beers.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}
