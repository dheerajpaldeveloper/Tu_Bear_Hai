import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tu_bear_hai/screens/beers_screen.dart';
import 'package:tu_bear_hai/viewmodels/beers_list_view_model.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffFEFDFD),
          appBarTheme: AppBarTheme(
            color: Color(0xffFEFDFD),
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => BeersListViewModel(),
            )
          ],
          child: HomeScreen(),
        ));
  }
}
