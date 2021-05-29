import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screeens/animal_detail_screen.dart';
import '../providers/animal.dart';

class AnimalItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // AnimalItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final animal = Provider.of<AnimalOBJ>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AnimalDetailScreen.routeName,
              arguments: animal.id,
            );
          },
          child: Image.network(
            animal.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: Consumer<AnimalOBJ>(
            //consuer allows smaller rebuild of patial widget if data changes instead of full rebuil
            builder: (ctx, animal, child) => IconButton(
              icon: Icon(
                animal.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: () {
                animal.toggleFavState();
              },
              color: Theme.of(context).accentColor,
            ),
          ),
          // trailing: IconButton(
          //   icon: Icon(animal.getIconFromName(animal.animalStatus)),
          //   onPressed: () {},
          //   color: Theme.of(context).accentColor,
          // ),
          backgroundColor: Colors.purple,
          title: Text(
            animal.name,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
