import 'package:intl/intl.dart';

class BeersModel {
  final String name;
  final String description;
  final String image_url;
  final String tagline;
  final List<String> food_pairing;
  final String ph;
  final String abv;
  final String ibu;
  final String first_brewed;
  final String target_fg;
  final String target_og;
  final String ebc;
  final String srm;
  final String attenuation_level;
  final String brewers_tips;

  BeersModel({
    this.description,
    this.image_url,
    this.name,
    this.tagline,
    this.food_pairing,
    this.ph,
    this.abv,
    this.first_brewed,
    this.attenuation_level,
    this.ebc,
    this.srm,
    this.target_fg,
    this.target_og,
    this.ibu,
    this.brewers_tips,
  });

  factory BeersModel.fromJson(Map<String, dynamic> json) {
    return BeersModel(
      name: json['name'],
      description: json['description'],
      image_url: json['image_url'],
      tagline: json['tagline'],
      food_pairing: parseFoodCompliment(json['food_pairing']),
      ph: json['ph'].toString(),
      first_brewed: json['first_brewed'].toString(),
      abv: json['abv'].toString(),
      ibu: json['ibu'].toString(),
      target_fg: json['target_fg'].toString(),
      target_og: json['target_og'].toString(),
      srm: json['srm'].toString(),
      ebc: json['ebc'].toString(),
      attenuation_level: json['attenuation_level'].toString(),
      brewers_tips: json['brewers_tips'],
    );
  }

  static List<String> parseFoodCompliment(foodJson) {
    List<String> foodList = new List<String>.from(foodJson);
    return foodList;
  }
}
