import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/vtr.dart';

enum animal_status {
  FHneeded,
  Homed,
  Fostered,
  PickUp,
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
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  animal_status animalStatus;
  bool isAvailableToAdopt;
  AnimalGender gender;
  Species species;
  VTR treatementRecord = new VTR();

  AnimalOBJ(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorite = false,
      @required this.isAvailableToAdopt,
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

  IconData getIconFromName(animal_status aStatus) {
    switch (animalStatus) {
      case animal_status.Homed:
        {
          return Icons.house;
        }
        break;
      case animal_status.Fostered:
        {
          return Icons.how_to_reg;
        }
        break;
      case animal_status.FHneeded:
        {
          return Icons.feedback;
        }
        break;
      case animal_status.PickUp:
        {
          return Icons.emoji_transportation;
        }
        break;
    }
  }
}
