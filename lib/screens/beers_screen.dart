import 'package:flutter/material.dart';
import 'package:tu_bear_hai/utils/constants.dart';
import 'package:tu_bear_hai/viewmodels/beers_list_view_model.dart';
import 'package:tu_bear_hai/widgets/news_grid.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<BeersListViewModel>(context, listen: false).topBeers();
  }

  Widget _buildList(BeersListViewModel vs) {
    switch (vs.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: NewsGrid(
            beers: vs.beers,
          ),
        );
      case LoadingStatus.empty:
      default:
        return Center(
          child: Text("No Beers found"),
        );
    }
  }

  void _selectYear(BeersListViewModel vs, String year) {
    vs.topBeersShortedByYears(Constants.Years[year]);
  }

  @override
  Widget build(BuildContext context) {
    var vs = Provider.of<BeersListViewModel>(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              accountEmail: Text("dheerajpaldeveloper@gmail.com"),
              accountName: Text("Dheeraj Pal"),
              currentAccountPicture: CircleAvatar(
                child: Image.asset("assets/images/profile.jpg"),
                //backgroundImage: NetworkImage("assets/images/profile.jpg"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Account"),
              subtitle: Text("personal"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("personal"),
              trailing: Icon(Icons.send_sharp),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              subtitle: Text("personal"),
              trailing: Icon(Icons.settings_applications),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.beenhere_rounded),
              title: Text("Top Beers"),
              subtitle: Text("years"),
              trailing: Icon(Icons.more),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {
              _selectYear(vs, value);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) {
              return Constants.Years.keys
                  .map((v) => PopupMenuItem(
                        value: v,
                        child: Text(v),
                      ))
                  .toList();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'Tu Bear hai',
                style: TextStyle(fontSize: 50),
              ),
            ),
            Divider(
              height: 20,
              color: Colors.blue,
              thickness: 8,
              indent: 10,
              endIndent: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
              child: Text(
                'Choice your favourite beer',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: _buildList(vs),
            ),
          ],
        ),
      ),
    );
  }
}
