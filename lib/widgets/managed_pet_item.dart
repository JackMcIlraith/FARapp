import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screeens/edit_animal.dart';
import '../providers/animal_provider.dart';

class ManagedPetItem extends StatelessWidget {
  final String id;
  final String name;
  final String imageURL;

  ManagedPetItem(
    this.id,
    this.name,
    this.imageURL,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageURL),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditAnimalScreen.routeName, arguments: id);
              },
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                Provider.of<Animals>(context, listen: false).deleteAnimal(id);
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
