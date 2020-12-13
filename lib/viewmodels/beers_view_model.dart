import 'package:tu_bear_hai/models/beers_model.dart';

class BeersViewModel {
  BeersModel _beersModel;

  BeersViewModel({BeersModel beers}) : _beersModel = beers;

  String get name {
    return _beersModel.name;
  }

  String get description {
    return _beersModel.description;
  }

  String get imageUrl {
    return _beersModel.image_url;
  }

  String get tagline {
    return _beersModel.tagline;
  }

  List<String> get food_pairing {
    return _beersModel.food_pairing;
  }

  String get ph {
    return _beersModel.ph;
  }

  String get first_brewed {
    return _beersModel.first_brewed;
  }

  String get abv {
    return _beersModel.abv;
  }

  String get ibu {
    return _beersModel.ibu;
  }

  String get target_fg {
    return _beersModel.target_fg;
  }

  String get target_og {
    return _beersModel.target_og;
  }

  String get attenuation_level {
    return _beersModel.attenuation_level;
  }

  String get ebc {
    return _beersModel.ebc;
  }

  String get srm {
    return _beersModel.srm;
  }

  String get brewers_tips {
    return _beersModel.brewers_tips;
  }
}
