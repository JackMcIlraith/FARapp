import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screeens/adopt_list.dart';
import 'package:flutter_complete_guide/screeens/pet_manager_screen.dart';
import 'package:flutter_complete_guide/screeens/testscreen.dart';
import 'package:flutter_complete_guide/screeens/vtr_screen.dart';

import '../widgets/animals_grid.dart';
import '../screeens/adopt_list.dart';
import '../screeens/foster_list.dart';
import '../screeens/pet_manager_screen.dart';

enum FilterOptions { All, Favourites, Foster, Adopt, InFoster, PickUp }

class AnimalsOverviewScreen extends StatefulWidget {
  @override
  _AnimalsOverviewScreenState createState() => _AnimalsOverviewScreenState();
}

class _AnimalsOverviewScreenState extends State<AnimalsOverviewScreen> {
  int _showOnly = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: Builder(
          //   //left menu
          //   builder: (BuildContext context) {
          //     return IconButton(
          //       icon: const Icon(Icons.menu),
          //       onPressed: () {
          //         Scaffold.of(context).openDrawer(

          //         );
          //       },
          //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          //     );
          //   },
          // ),
          title: Center(child: Text('Our Animals')),
          actions: <Widget>[
            PopupMenuButton(
              //filter
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favourites) {
                    _showOnly = 1;
                  } else if (selectedValue == FilterOptions.InFoster) {
                    _showOnly = 2;
                  } else if (selectedValue == FilterOptions.Foster) {
                    _showOnly = 3;
                  } else if (selectedValue == FilterOptions.Adopt) {
                    _showOnly = 4;
                  } else if (selectedValue == FilterOptions.PickUp) {
                    _showOnly = 5;
                  } else
                    _showOnly = 0;
                });
              },
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                    child: Text('Show All'), value: FilterOptions.All),
                PopupMenuItem(
                    child: Text('Favorites'), value: FilterOptions.Favourites),
                PopupMenuItem(
                    child: Text('Avalible to Foster'),
                    value: FilterOptions.Foster),
                PopupMenuItem(
                    child: Text('Avalible to Adopt'),
                    value: FilterOptions.Adopt),
                PopupMenuItem(
                    child: Text('In Foster Home'),
                    value: FilterOptions.InFoster),
                PopupMenuItem(
                    child: Text('Awaiting Pickup'),
                    value: FilterOptions.PickUp),
              ],
            ),
          ]),
      body: AnimalsGrid(_showOnly),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 50.0,
              child: DrawerHeader(
                  child: Text(
                    'Menu:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  decoration: BoxDecoration(color: Colors.purple),
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.all(4.0)),
            ),
            ListTile(
              title: Text('Adoption applications'),
              onTap: () {
                Navigator.of(context).pushNamed(AdoptScreen.routeName);
              },
            ),
            ListTile(
              title: Text('Foster applications'),
              onTap: () {
                Navigator.of(context).pushNamed(FosterScreen.routeName);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Manage Animals'),
              onTap: () {
                Navigator.of(context).pushNamed(ManagePets.routeName);
              },
            ),
            Divider(),
            ListTile(
              title: Text('TestScreen'),
              onTap: () {
                Navigator.of(context).pushNamed(TestScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
