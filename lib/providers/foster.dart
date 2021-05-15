import 'package:flutter/cupertino.dart';

enum FosteringStatus {
  Pending,
  Rejected,
  Approved,
}

class InterestedFosterAnimals {
  final String id;
  final String name;
  final String imageURL;
  FosteringStatus fosteringStatus;

  InterestedFosterAnimals({
    @required this.id,
    @required this.name,
    @required this.imageURL,
    this.fosteringStatus = FosteringStatus.Pending,
  });
}

class Foster with ChangeNotifier {
  Map<String, InterestedFosterAnimals> _animals = {};

//getter
  Map<String, InterestedFosterAnimals> get animals {
    return {..._animals};
  }

  int get numberOfApplications {
    return _animals.length;
  }

  //add to intrested list:
  void addToInterested(String animalID, String name, String imageURL) {
    if (_animals.containsKey(animalID)) {
      //dont do anything if the animal already exists
      return;
    } else {
      _animals.putIfAbsent(
        animalID,
        () => InterestedFosterAnimals(
          id: DateTime.now().toString(),
          name: name,
          imageURL: imageURL,
        ),
      );
    }
  }
}
