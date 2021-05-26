import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'animal.dart';

class Animals with ChangeNotifier {
  List<AnimalOBJ> _items = [
    // AnimalOBJ(
    //   id: 'p1',
    //   name: 'Taco Cat',
    //   description:
    //       '""At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et mo"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."lestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."',
    //   imageUrl:
    //       'https://shapegrams.com/wp-content/uploads/2020/03/Tacocat-Featured-Image-1600x1600.png',
    //   animalStatus: AnimalStatus.Foster_Needed,
    //   isAvailableToAdopt: true,
    //   gender: AnimalGender.Male,
    //   species: Species.Cat,
    // ),
    // AnimalOBJ(
    //   id: 'p2',
    //   name: 'Picachu',
    //   description: 'Pokemon',
    //   imageUrl:
    //       'https://i.pinimg.com/originals/f5/1d/08/f51d08be05919290355ac004cdd5c2d6.png',
    //   animalStatus: AnimalStatus.Fostered,
    //   isAvailableToAdopt: true,
    // ),
    // AnimalOBJ(
    //     id: 'p3',
    //     name: 'Doggo',
    //     description: 'Bark Bark yo',
    //     isAvailableToAdopt: true,
    //     gender: AnimalGender.Female,
    //     imageUrl:
    //         'https://media.wired.com/photos/5a5547032b3a7778f5ca06cb/125:94/w_1593,h_1198,c_limit/Doggo-FeatureArt2-104685145.jpg',
    //     animalStatus: AnimalStatus.Homed),
    // AnimalOBJ(
    //   id: 'p4',
    //   name: 'A Cat',
    //   description: 'pss pss pss',
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/VAN_CAT.png/600px-VAN_CAT.png',
    //   isAvailableToAdopt: false,
    //   animalStatus: AnimalStatus.Homed,
    // ),
    // AnimalOBJ(
    //     id: 'p5',
    //     name: 'Kitten',
    //     description: 'Young kitten',
    //     isAvailableToAdopt: true,
    //     imageUrl:
    //         'https://www.askideas.com/media/24/Little-Siberian-Kitten-In-Hand.jpg',
    //     animalStatus: AnimalStatus.Fostered),
    // AnimalOBJ(
    //     id: 'p6',
    //     name: 'Angry Fluff',
    //     description: 'This cat is fluffy and not very friendly',
    //     isAvailableToAdopt: false,
    //     imageUrl:
    //         'https://viralcats.net/blog/wp-content/uploads/2017/10/Garfi-02-Viral-Cats.jpg',
    //     animalStatus: AnimalStatus.Foster_Needed),
    // AnimalOBJ(
    //     id: 'p7',
    //     name: 'Grumpy Cat',
    //     description: 'The one and only grumpy cat',
    //     isAvailableToAdopt: false,
    //     imageUrl:
    //         'https://static01.nyt.com/images/2019/05/19/world/17grumpycat-1/17grumpycat-1-videoSixteenByNine3000.jpg',
    //     animalStatus: AnimalStatus.Homed),
    // AnimalOBJ(
    //     id: 'p8',
    //     name: 'Garfield',
    //     description: 'I hate Mondays',
    //     isAvailableToAdopt: false,
    //     imageUrl: 'https://cdn.hipwallpaper.com/i/17/41/skHxbR.jpg',
    //     animalStatus: AnimalStatus.Homed),
    // AnimalOBJ(
    //     id: 'p9',
    //     name: 'Scooby Doo',
    //     description: 'Scooby Doo where are you?',
    //     isAvailableToAdopt: true,
    //     imageUrl:
    //         'https://webstockreview.net/images/scooby-doo-clipart-file-3.jpg',
    //     animalStatus: AnimalStatus.PickUp),
    // AnimalOBJ(
    //     id: 'p10',
    //     name: 'Dalmations',
    //     description: '2 Dalmation pups',
    //     isAvailableToAdopt: true,
    //     imageUrl:
    //         'https://3.bp.blogspot.com/-WIupHDhU9o0/T9GIWKkA5TI/AAAAAAAAB54/8reA16sMII0/s1600/Dalmatian+images.jpg',
    //     animalStatus: AnimalStatus.Fostered),
    // AnimalOBJ(
    //     id: 'p11',
    //     name: 'Chocolate Labrador',
    //     description: 'Chocolate Labrodor',
    //     isAvailableToAdopt: true,
    //     imageUrl:
    //         'http://kschulzphotography.com/wp-content/uploads/2017/04/0002-2.jpg',
    //     animalStatus: AnimalStatus.Foster_Needed),
  ];
  var _showFavoritesOnly = false;

  List<AnimalOBJ> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((ani) => ani.isFavorite == true).toList();
    // }
    return [..._items];
  }

  AnimalOBJ findByID(String id) {
    return _items.firstWhere((ani) => ani.id == id);
  }

  List<AnimalOBJ> get favouteAnimals {
    return _items.where((ani) => ani.isFavorite).toList();
  }

  List<AnimalOBJ> get fosterHomeNeededAnimals {
    return _items
        .where((ani) => ani.animalStatus == AnimalStatus.Foster_Needed)
        .toList();
  }

  List<AnimalOBJ> get adoptableAnimals {
    return _items.where((ani) => ani.isAvailableToAdopt).toList();
  }

  List<AnimalOBJ> get inFosterHomeAnimals {
    return _items
        .where((ani) => ani.animalStatus == AnimalStatus.Fostered)
        .toList();
  }

  List<AnimalOBJ> get awaitingPickUpHomeAnimals {
    return _items
        .where((ani) => ani.animalStatus == AnimalStatus.PickUp)
        .toList();
  }

  // void filterFavorites() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void filterAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  Future<void> addAnimals(AnimalOBJ animal) {
    //http:
    final url = Uri.parse(
        'https://rescueapp-43a3d-default-rtdb.europe-west1.firebasedatabase.app/animals.json');
    return http //return http responce as a future, only resolves after 'then' block
        .post(
      url,
      body: json.encode({
        'name': animal.name,
        'description': animal.description,
        'imageUrl': animal.imageUrl,
        'isFavorite': animal.isFavorite,
        'animalStatus': animal.animalStatus.toString(),
        'isAvailableToAdopt': animal.isAvailableToAdopt,
        'gender': animal.gender.toString(),
        'species': animal.species.toString(),
      }),
    )
        .then((responce) {
      //add local animal after responce from firebase
      //responce object gives firebase id for new obj
      //print(json.decode(responce.body));
      // responce body: {name: key}
      final newAnimal = AnimalOBJ(
        id: json.decode(responce.body)['name'].toString(),
        name: animal.name,
        description: animal.description,
        imageUrl: animal.imageUrl,
        isFavorite: animal.isFavorite,
        animalStatus: animal.animalStatus,
        isAvailableToAdopt: animal.isAvailableToAdopt,
        gender: animal.gender,
        species: animal.species,
      );
      //add to end of list of
      _items.add(newAnimal);
      notifyListeners();
    }).catchError((error) {
      throw error;
    });
  }

  Future<void> updateAnimal(String id, AnimalOBJ updateAnimal) async {
    final animalLocation = _items.indexWhere((animal) => animal.id == id);
    final url = Uri.parse(
        'https://rescueapp-43a3d-default-rtdb.europe-west1.firebasedatabase.app/animals/$id.json');
    http.patch(url,
        body: json.encode({
          'name': updateAnimal.name,
          'description': updateAnimal.description,
          'imageUrl': updateAnimal.imageUrl,
          'isFavorite': updateAnimal.isFavorite,
          'animalStatus': updateAnimal.animalStatus.toString(),
          'isAvailableToAdopt': updateAnimal.isAvailableToAdopt,
          'gender': updateAnimal.gender.toString(),
          'species': updateAnimal.species.toString(),
        }));
    _items[animalLocation] = updateAnimal;
    notifyListeners();
  }

  void deleteAnimal(String id) {
    print("trying to delete  " + id);
    final url = Uri.parse(
        'https://rescueapp-43a3d-default-rtdb.europe-west1.firebasedatabase.app/animals/$id.json');
    final existingAnimalIndex = _items.indexWhere((animal) => animal.id == id);
    var existingAnimal = _items[existingAnimalIndex];
    _items.removeAt(existingAnimalIndex);
    http.delete(url).then((_) {
      existingAnimal = null;
    }).catchError((_) {
      _items.insert(existingAnimalIndex, existingAnimal);
    });
    _items.removeWhere((animal) => animal.id == id);
    notifyListeners();
  }

  Future<void> fetchAndSetAnimals() async {
    final url = Uri.parse(
        'https://rescueapp-43a3d-default-rtdb.europe-west1.firebasedatabase.app/animals.json');
    try {
      final responce = await http.get(url);
      final receivedData = json.decode(responce.body) as Map<String, dynamic>;
      final List<AnimalOBJ> loadedAnimals = [];
      receivedData.forEach((animalID, animalData) {
        loadedAnimals.add(AnimalOBJ(
          id: animalID,
          name: animalData['name'],
          description: animalData['description'],
          imageUrl: animalData['imageUrl'],
          isFavorite: animalData['isFavorite'],
          animalStatus: initAnimalState(animalData['animalStatus']),
          isAvailableToAdopt: animalData['isAvailableToAdopt'],
          gender: initGender(animalData['gender']),
          species: initSpeicies(animalData['species']),
        ));
      });
      _items = loadedAnimals;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Species initSpeicies(String key) {
    if (key == 'Species.Dog') {
      return Species.Dog;
    } else if (key == 'Species.Cat') {
      return Species.Cat;
    } else if (key == 'Species.Other') {
      return Species.Other;
    } else
      return null;
  }

  AnimalStatus initAnimalState(String key) {
    if (key == 'AnimalStatus.Foster_Needed') {
      return AnimalStatus.Foster_Needed;
    } else if (key == 'AnimalStatus.Homed') {
      return AnimalStatus.Homed;
    } else if (key == 'AnimalStatus.Fostered') {
      return AnimalStatus.Fostered;
    } else if (key == 'AnimalStatus.PickUp') {
      return AnimalStatus.PickUp;
    } else
      return null;
  }

  AnimalGender initGender(String key) {
    if (key == 'AnimalGender.Female') {
      return AnimalGender.Female;
    } else if (key == 'AnimalGender.Male') {
      return AnimalGender.Male;
    } else
      return null;
  }
}
