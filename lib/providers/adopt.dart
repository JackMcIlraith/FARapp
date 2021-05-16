import 'package:flutter/cupertino.dart';

enum AdoptionStatus {
  Pending,
  Rejected,
  Approved,
}

class InterestedAnimals {
  final String id;
  final String name;
  final String imageURL;
  AdoptionStatus adoptStatus;

  InterestedAnimals({
    @required this.id,
    @required this.name,
    @required this.imageURL,
    this.adoptStatus = AdoptionStatus.Pending,
  });
}

class Adopt with ChangeNotifier {
  Map<String, InterestedAnimals> _animals = {};

//getter
  Map<String, InterestedAnimals> get animals {
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
        () => InterestedAnimals(
          id: DateTime.now().toString(),
          name: name,
          imageURL: imageURL,
        ),
      );
    }
  }

  void removeApplication(String id) {
    _animals.remove(id);
    notifyListeners();
  }
}
