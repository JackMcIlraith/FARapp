import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/adopt.dart';

// ignore: must_be_immutable
class AdoptItem extends StatelessWidget {
  String _id;

  String _animalID;
  String _name;
  String _imageURL;
  AdoptionStatus _adoptStatus;

  AdoptItem(
      this._id, this._animalID, this._name, this._imageURL, this._adoptStatus);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(_id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Adopt>(
          context,
          listen: false,
        ).removeApplication(_animalID);
      },
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            trailing: Text(_adoptStatus.toString().split('.').last),
            leading: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(_imageURL),
              backgroundColor: Colors.transparent,
            ),
            title: Text(_name),
          ),
        ),
      ),
    );
  }
}
