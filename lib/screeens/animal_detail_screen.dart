import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/animal.dart';
import 'package:provider/provider.dart';

import '../providers/animal_provider.dart';
import '../providers/adopt.dart';
import '../providers/foster.dart';
import '../widgets/application_dropdown.dart';

class AnimalDetailScreen extends StatelessWidget {
  // final String title;

  // AnimalDetailScreen(this.title);
  static const routeName = '/animal-detail';

  @override
  Widget build(BuildContext context) {
    final animalID =
        ModalRoute.of(context).settings.arguments as String; //will give ID

    final loadedAnimal = Provider.of<Animals>(
      context,
      listen: false,
    ).items.firstWhere((prod) => prod.id == animalID);
    final adopt = Provider.of<Adopt>(
      context,
      listen: false,
    );
    final foster = Provider.of<Foster>(
      context,
      listen: false,
    );
    return Scaffold(
      endDrawer: AplicationPrereq(
              isAdoptable: loadedAnimal.isAvailableToAdopt,
              animalStatus: loadedAnimal.animalStatus,
              id: loadedAnimal.id,
              name: loadedAnimal.name,
              imageUrl: loadedAnimal.imageUrl)
          .build(context),
      // endDrawer: Drawer(
      //   child: ListView(
      //     children: <Widget>[
      //       SizedBox(
      //         height: 50.0,
      //         child: DrawerHeader(
      //             child: Text(
      //               'Make an apllication',
      //               textAlign: TextAlign.center,
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 24,
      //               ),
      //             ),
      //             decoration: BoxDecoration(color: Colors.purple),
      //             margin: EdgeInsets.all(5.0),
      //             padding: EdgeInsets.all(4.0)),
      //       ),
      //       ListTile(
      //         title: Text('Apply to adopt'),
      //         onTap: () {
      //           adopt.addToInterested(
      //             loadedAnimal.id,
      //             loadedAnimal.title,
      //             loadedAnimal.imageUrl,
      //           );
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Apply to foster'),
      //         onTap: () {
      //           foster.addToInterested(
      //             loadedAnimal.id,
      //             loadedAnimal.title,
      //             loadedAnimal.imageUrl,
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        leading: BackButton(),
        title: Text(loadedAnimal.name),
        // actions: <Widget>[
        //   Builder(
        //     //Adopt
        //     builder: (BuildContext context) {
        //       return IconButton(
        //         icon: const Icon(Icons.menu),
        //         onPressed: () {
        //           adopt.addToInterested(
        //             loadedAnimal.id,
        //             loadedAnimal.title,
        //             loadedAnimal.imageUrl,
        //           );
        //         },
        //       );
        //     },
        //   ),
        //   Builder(
        //     //foster
        //     builder: (BuildContext context) {
        //       return IconButton(
        //         icon: const Icon(Icons.menu),
        //         onPressed: () {
        //           foster.addToInterested(
        //             loadedAnimal.id,
        //             loadedAnimal.title,
        //             loadedAnimal.imageUrl,
        //           );
        //         },
        //         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //       );
        //     },
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedAnimal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 4,
                ),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(
                        GenderKeyReturn(loadedAnimal.gender),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      leading: Text(
                        loadedAnimal.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      trailing: Text(
                        SpeiciesKeyReturn(loadedAnimal.species),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //next card:
            Container(
              child: Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 4,
                ),
                child: Container(
                  child: ListTile(
                    title: Text(
                      AdoptableKeyReturn(loadedAnimal.isAvailableToAdopt),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    leading: Text(
                      'Current Status:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    subtitle: Text(
                      StatusKeyReturn(loadedAnimal.animalStatus),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),

            //end card
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                loadedAnimal.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String StatusKeyReturn(AnimalStatus animalStatus) {
    if (animalStatus == AnimalStatus.Foster_Needed) {
      return 'Foster Needed';
    } else if (animalStatus == AnimalStatus.Fostered) {
      return 'Fostered';
    } else if (animalStatus == AnimalStatus.PickUp) {
      return 'Awaiting Pickup';
    } else if (animalStatus == AnimalStatus.PickUp) {
      return 'Awaiting Pickup';
    } else if (animalStatus == AnimalStatus.Homed) {
      return 'Already Homed';
    }
  }

  String AdoptableKeyReturn(bool isAdoptable) {
    if (isAdoptable) {
      return 'Adoptable';
    } else
      return 'Unavailable to adopt';
  }

  String GenderKeyReturn(AnimalGender gender) {
    if (gender != null) {
      return gender.toString().split('.').last;
    } else
      return '';
  }

  String SpeiciesKeyReturn(Species species) {
    if (species != null) {
      return species.toString().split('.').last;
    } else
      return '';
  }
}
