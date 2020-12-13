class Constants {
  static const String BASE_URL = 'https://api.punkapi.com/v2/beers';

  static String yearSelect(String year) {
    return 'https://api.punkapi.com/v2/beers?brewed_before=$year';
  }

  static const Map<String, String> Years = {
    "2011": "11-2011",
    "2012": "11-2012",
    "2015": "11-2015",
    "2020": "11-2020"
  };
}
