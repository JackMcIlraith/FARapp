import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/foster.dart';

// ignore: must_be_immutable
class FosterItem extends StatelessWidget {
  String _id;
  String _animalID;
  String _name;
  String _imageURL;
  FosteringStatus _fosteringStatus;

  FosterItem(this._id, this._animalID, this._name, this._imageURL,
      this._fosteringStatus);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(_id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Foster>(
          context,
          listen: false,
        ).removeApplication(_animalID);
      },
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text(
              'Are you sure you no longer want to foster $_name?',
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: Text('Yes'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: Text('No'),
              ),
            ],
          ),
        );
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
            trailing: Text(_fosteringStatus.toString().split('.').last),
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
