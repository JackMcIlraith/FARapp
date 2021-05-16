import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/vtr.dart';
import 'package:provider/provider.dart';
import 'package:flushbar/flushbar.dart';

import '../providers/animal.dart';
import '../providers/adopt.dart';
import '../providers/foster.dart';
import '../screeens/vtr_screen.dart';

// ignore: must_be_immutable
class AplicationPrereq extends StatelessWidget {
  bool isAdoptable;
  AnimalStatus animalStatus;
  String id;
  String name;
  String imageUrl;

  AplicationPrereq({
    this.isAdoptable,
    this.animalStatus,
    this.id,
    this.name,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (isAdoptable &&
        (animalStatus == AnimalStatus.Foster_Needed ||
            animalStatus == AnimalStatus.PickUp)) {
      return F_and_A(context);
    } else if (!isAdoptable &&
        (animalStatus == AnimalStatus.Foster_Needed ||
            animalStatus == AnimalStatus.PickUp)) {
      return F_Only(context);
    } else if (isAdoptable && (animalStatus == AnimalStatus.Fostered)) {
      return A_Only(context);
    } else
      return null;
  }

  //Foster & Adopt:
  Widget F_and_A(BuildContext context) {
    final adopt = Provider.of<Adopt>(
      context,
      listen: false,
    );
    final foster = Provider.of<Foster>(
      context,
      listen: false,
    );
    // final vtr = Provider.of<VTR>(
    //   context,
    //   listen: false,
    // );

    //see about conditional menus:

    return Drawer(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 50.0,
            child: DrawerHeader(
                child: Text(
                  'Apply for:',
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
            title: Text('Apply to adopt'),
            onTap: () {
              adopt.addToInterested(
                id,
                name,
                imageUrl,
              );
              Flushbar(
                message: "Adoption application submitted",
                duration: Duration(seconds: 3),
              )..show(context);
            },
          ),
          ListTile(
            title: Text('Apply to foster'),
            onTap: () {
              foster.addToInterested(
                id,
                name,
                imageUrl,
              );
              Flushbar(
                message: "Foster application submitted",
                duration: Duration(seconds: 3),
              )..show(context);
            },
          ),
          // ListTile(
          //   title: Text('Go To VTR'),
          //   onTap: () {
          //     Navigator.of(context).pushNamed(VTRScreen.routeName);
          //   },
          // ),
        ],
      ),
    );
  }

  //Foster & !Adopt:
  Widget F_Only(BuildContext context) {
    final adopt = Provider.of<Adopt>(
      context,
      listen: false,
    );
    final foster = Provider.of<Foster>(
      context,
      listen: false,
    );

    //see about conditional menus:

    return Drawer(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 50.0,
            child: DrawerHeader(
                child: Text(
                  'Apply for:',
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
            title: Text('Apply to foster'),
            onTap: () {
              foster.addToInterested(
                id,
                name,
                imageUrl,
              );
              Flushbar(
                message: "Foster application submitted",
                duration: Duration(seconds: 3),
              )..show(context);
            },
          ),
        ],
      ),
    );
    //!Foster & Adopt:
    //None
  }

  Widget A_Only(BuildContext context) {
    final adopt = Provider.of<Adopt>(
      context,
      listen: false,
    );
    final foster = Provider.of<Foster>(
      context,
      listen: false,
    );

    //see about conditional menus:

    return Drawer(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 50.0,
            child: DrawerHeader(
                child: Text(
                  'Apply for:',
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
            title: Text('Apply to adopt'),
            onTap: () {
              adopt.addToInterested(
                id,
                name,
                imageUrl,
              );
              Flushbar(
                message: "Adoption application submitted",
                duration: Duration(seconds: 3),
              )..show(context);
            },
          ),
        ],
      ),
    );
  }
}
