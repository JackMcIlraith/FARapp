import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/animal_provider.dart';
import 'animal_item.dart';

enum FilterOptions { All, Favourites, Foster, Adopt, InFoster, PickUp }

class AnimalsGrid extends StatelessWidget {
  final int filter;

  AnimalsGrid(this.filter);

  @override
  Widget build(BuildContext context) {
    final animalsData = Provider.of<Animals>(context);
    //need filter logic here:
    var animals = animalsData.items;
    switch (filter) {
      case 1:
        {
          animals = animalsData.favouteAnimals;
        }
        break;

      case 3:
        {
          animals = animalsData.fosterHomeNeededAnimals;
        }
        break;
      case 4:
        {
          animals = animalsData.adoptableAnimals;
        }
        break;
      case 2:
        {
          animals = animalsData.inFosterHomeAnimals;
        }
        break;
      case 5:
        {
          animals = animalsData.awaitingPickUpHomeAnimals;
        }
        break;
      case 0:
        {
          animals = animalsData.items;
        }
        break;
      default:
        animals = animalsData.items;
    }
    //final animals = filterFunction(filter, animalsData);

    return GridView.builder(
      padding: const EdgeInsets.all(5.0),
      itemCount: animals.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //use .value when using lists/grids, as ctx will crash on scroll
        value: animals[i],
        child: AnimalItem(
            // animals[i].id,
            // animals[i].title,
            // animals[i].imageUrl,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }

  filterFunction(int filter, Animals animalsData) {
    // switch (filter) {
    //   case 1:
    //     {
    //       return animalsData.favouteAnimals;
    //     }
    //     break;

    //   case 3:
    //     {
    //       return animalsData.fosterHomeNeededAnimals;
    //     }
    //     break;
    //   case 4:
    //     {
    //       return animalsData.adoptableAnimals;
    //     }
    //     break;
    //   case 2:
    //     {
    //       return animalsData.inFosterHomeAnimals;
    //     }
    //     break;
    //   case 5:
    //     {
    //       return animalsData.awaitingPickUpHomeAnimals;
    //     }
    //     break;
    //   case 0:
    //     {
    //       return animalsData.items;
    //     }
    //     break;
    //   default:
    //     return animalsData.items;
    // }
  }
}
