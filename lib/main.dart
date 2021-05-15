import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/animal.dart';
import 'package:provider/provider.dart';

import 'screeens/animal_overview_screen.dart';
import 'screeens/animal_detail_screen.dart';
import 'screeens/adopt_list.dart';
import 'screeens/foster_list.dart';
import 'screeens/vtr_screen.dart';

import './providers/animal_provider.dart';
import './providers/adopt.dart';
import './providers/foster.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          //need create when instanciating, helps avoid bugs
          create: (ctx) => Animals(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Adopt(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Foster(),
        ),
      ],
      child: MaterialApp(
        title: 'Acme Pet Rescue', //update name
        theme: ThemeData(
          primarySwatch: Colors.purple, //primary txt colour
          accentColor: Colors.blue, // icon colours
          fontFamily: 'Lato',
        ),
        home: AnimalsOverviewScreen(),
        routes: {
          AnimalDetailScreen.routeName: (ctx) => AnimalDetailScreen(),
          AdoptScreen.routeName: (ctx) => AdoptScreen(),
          FosterScreen.routeName: (ctx) => FosterScreen(),
          VTRScreen.routeName: (ctx) => VTRScreen(),
        },
      ),
    );
  }
}

/*
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Store Yo'),
      ),
      body: Center(
        child: Text('Let\'s build a shop!'),
      ),
    );
  }
}
*/
