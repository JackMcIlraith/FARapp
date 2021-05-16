import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/animal_provider.dart';
import '../widgets/managed_pet_item.dart';
import '../providers/foster.dart';
import '../widgets/foster_item.dart';

class ManagePets extends StatelessWidget {
  static const routeName = '/manage';

  @override
  Widget build(BuildContext context) {
    final animalData = Provider.of<Animals>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Current animals'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: animalData.items.length,
          itemBuilder: (_, i) => Column(
            children: [
              ManagedPetItem(
                animalData.items[i].title,
                animalData.items[i].imageUrl,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
    // final foster = Provider.of<Foster>(context);
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Your pending foster applications'),
    //   ),
    // );
  }
}
