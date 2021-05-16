import 'package:flutter/material.dart';

class ManagedPetItem extends StatelessWidget {
  final String name;
  final String imageURL;

  ManagedPetItem(
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
              onPressed: () {},
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
