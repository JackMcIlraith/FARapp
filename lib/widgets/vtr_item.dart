import 'package:flutter/material.dart';

import '../providers/adopt.dart';

// ignore: must_be_immutable
class VTRItem extends StatelessWidget {
  String _id;
  String _dateOfVisit;
  String _description;
  AdoptionStatus _adoptStatus;

  VTRItem(
    this._id,
    this._dateOfVisit,
    this._description,
  );

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
            backgroundImage: NetworkImage(_dateOfVisit),
            backgroundColor: Colors.transparent,
          ),
          title: Text(_description),
        ),
      ),
    );
  }
}
