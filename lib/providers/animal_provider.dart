import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animal.dart';

class Animals with ChangeNotifier {
  List<AnimalOBJ> _items = [
    AnimalOBJ(
      id: 'p1',
      name: 'Taco Cat',
      description:
          '""At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et mo"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."lestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."',
      imageUrl:
          'https://shapegrams.com/wp-content/uploads/2020/03/Tacocat-Featured-Image-1600x1600.png',
      animalStatus: AnimalStatus.Foster_Needed,
      isAvailableToAdopt: true,
      gender: AnimalGender.Male,
      species: Species.Cat,
    ),
    AnimalOBJ(
      id: 'p2',
      name: 'Picachu',
      description: 'Pokemon',
      imageUrl:
          'https://i.pinimg.com/originals/f5/1d/08/f51d08be05919290355ac004cdd5c2d6.png',
      animalStatus: AnimalStatus.Fostered,
      isAvailableToAdopt: true,
    ),
    AnimalOBJ(
        id: 'p3',
        name: 'Doggo',
        description: 'Bark Bark yo',
        isAvailableToAdopt: true,
        imageUrl:
            'https://media.wired.com/photos/5a5547032b3a7778f5ca06cb/125:94/w_1593,h_1198,c_limit/Doggo-FeatureArt2-104685145.jpg',
        animalStatus: AnimalStatus.Homed),
    AnimalOBJ(
      id: 'p4',
      name: 'A Cat',
      description: 'pss pss pss',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/VAN_CAT.png/600px-VAN_CAT.png',
      isAvailableToAdopt: false,
      animalStatus: AnimalStatus.Homed,
    ),
    AnimalOBJ(
        id: 'p5',
        name: 'Kitten',
        description: 'Young kitten',
        isAvailableToAdopt: true,
        imageUrl:
            'https://www.askideas.com/media/24/Little-Siberian-Kitten-In-Hand.jpg',
        animalStatus: AnimalStatus.Fostered),
    AnimalOBJ(
        id: 'p6',
        name: 'Angry Fluff',
        description: 'This cat is fluffy and not very friendly',
        isAvailableToAdopt: false,
        imageUrl:
            'https://viralcats.net/blog/wp-content/uploads/2017/10/Garfi-02-Viral-Cats.jpg',
        animalStatus: AnimalStatus.Foster_Needed),
    AnimalOBJ(
        id: 'p7',
        name: 'Grumpy Cat',
        description: 'The one and only grumpy cat',
        isAvailableToAdopt: false,
        imageUrl:
            'https://static01.nyt.com/images/2019/05/19/world/17grumpycat-1/17grumpycat-1-videoSixteenByNine3000.jpg',
        animalStatus: AnimalStatus.Homed),
    AnimalOBJ(
        id: 'p8',
        name: 'Garfield',
        description: 'I hate Mondays',
        isAvailableToAdopt: false,
        imageUrl: 'https://cdn.hipwallpaper.com/i/17/41/skHxbR.jpg',
        animalStatus: AnimalStatus.Homed),
    AnimalOBJ(
        id: 'p9',
        name: 'Scooby Doo',
        description: 'Scooby Doo where are you?',
        isAvailableToAdopt: true,
        imageUrl:
            'https://webstockreview.net/images/scooby-doo-clipart-file-3.jpg',
        animalStatus: AnimalStatus.PickUp),
    AnimalOBJ(
        id: 'p10',
        name: 'Dalmations',
        description: '2 Dalmation pups',
        isAvailableToAdopt: true,
        imageUrl:
            'https://3.bp.blogspot.com/-WIupHDhU9o0/T9GIWKkA5TI/AAAAAAAAB54/8reA16sMII0/s1600/Dalmatian+images.jpg',
        animalStatus: AnimalStatus.Fostered),
    AnimalOBJ(
        id: 'p11',
        name: 'Chocolate Labrador',
        description: 'Chocolate Labrodor',
        isAvailableToAdopt: true,
        imageUrl:
            'http://kschulzphotography.com/wp-content/uploads/2017/04/0002-2.jpg',
        animalStatus: AnimalStatus.Foster_Needed),
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

  void addAnimals(AnimalOBJ animal) {
    final newAnimal = AnimalOBJ(
      id: DateTime.now().toString(),
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
  }
}
