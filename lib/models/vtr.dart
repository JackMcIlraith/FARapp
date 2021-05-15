import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Record {
  final String id;
  String animalID;
  final DateTime dateEntered = DateTime.now();
  String dateOfVisit;
  String description;

  Record({
    this.id,
    this.animalID,
    this.dateOfVisit,
    this.description,
  });
}

class VTR with ChangeNotifier {
  Map<String, Record> _vetRecord = {};

//getter
  Map<String, Record> get vetRecord {
    return {..._vetRecord};
  }

  int get numberOfRecords {
    return _vetRecord.length;
  }

  void addToInterested(
      String animalID, String dateOfVisit, String description) {
    _vetRecord.putIfAbsent(
      DateTime.now().toString(),
      () => Record(
        id: DateTime.now().toString(),
        animalID: animalID,
        dateOfVisit: dateOfVisit,
        description: description,
      ),
    );
  }
}
