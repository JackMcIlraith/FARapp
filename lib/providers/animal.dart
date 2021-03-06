import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/vtr.dart';

enum AnimalStatus {
  Foster_Needed, //for animals that are in the rescue, but require a foster home.
  Homed, //for animals that have been sucessfuly adopted, but are still on the app.
  Fostered, // for animals that have a foster home, but are not adopted yet.
  PickUp, //for animals that are still 'at large' and will be sent directly to a fosterer.
}
enum AnimalGender {
  Male,
  Female,
}
enum Species {
  Cat,
  Dog,
  Other,
}

class AnimalOBJ with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  bool isFavorite;
  AnimalStatus animalStatus;
  bool isAvailableToAdopt;
  AnimalGender gender;
  Species species;
  //VTR treatementRecord = new VTR();

  AnimalOBJ(
      {this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.isFavorite = false,
      this.isAvailableToAdopt,
      this.animalStatus,
      this.gender,
      this.species});

  void toggleFavState() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void toggleAvalibility() {
    isAvailableToAdopt = !isAvailableToAdopt;
    notifyListeners();
  }

  IconData getIconFromName(AnimalStatus aStatus) {
    switch (animalStatus) {
      case AnimalStatus.Homed:
        {
          return Icons.house;
        }
        break;
      case AnimalStatus.Fostered:
        {
          return Icons.how_to_reg;
        }
        break;
      case AnimalStatus.Foster_Needed:
        {
          return Icons.feedback;
        }
        break;
      case AnimalStatus.PickUp:
        {
          return Icons.emoji_transportation;
        }
        break;
    }
  }
}
