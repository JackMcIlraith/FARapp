import 'package:flutter/material.dart';

import '../providers/adopt.dart';

// ignore: must_be_immutable
class AdoptItem extends StatelessWidget {
  String _id;
  String _name;
  String _imageURL;
  AdoptionStatus _adoptStatus;

  AdoptItem(this._id, this._name, this._imageURL, this._adoptStatus);

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
