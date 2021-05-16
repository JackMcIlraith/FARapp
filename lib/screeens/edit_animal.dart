import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/animal.dart';
import '../providers/animal_provider.dart';

class EditAnimalScreen extends StatefulWidget {
  static const routeName = '/editanimal';
  @override
  _EditAnimalScreenState createState() => _EditAnimalScreenState();
}

class _EditAnimalScreenState extends State<EditAnimalScreen> {
  final _descriptionFocus = FocusNode();
  final _imageURLController = TextEditingController();
  final _imageURLFocus = FocusNode();
  AnimalGender _animalGender;
  Species _animalSpecies;
  AnimalStatus _animalState;
  bool _isAvalibleToAdopt;
  final _form = GlobalKey<FormState>();
  //basic animal to be updated.
  var _additAnimal = AnimalOBJ(
      id: null,
      name: null,
      description: null,
      imageUrl: null,
      isAvailableToAdopt: null,
      species: null,
      gender: null,
      animalStatus: null,
      isFavorite: false);

  void initState() {
    _imageURLFocus.addListener(_updateImageURLPreview);
    super.initState();
  }

  void _updateImageURLPreview() {
    if (!_imageURLFocus.hasFocus) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _imageURLFocus.removeListener(_updateImageURLPreview);
    _descriptionFocus.dispose();
    _imageURLController.dispose();
    _imageURLController.dispose();
    _imageURLFocus.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      //stops function if invalid fields are present
      return;
    }
    _form.currentState.save();
    final animalsList = Provider.of<Animals>(context, listen: false);
    animalsList.addAnimals(_additAnimal);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Animal'),
        actions: <Widget>[
          IconButton(
            onPressed: _saveForm,
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Aniaml Name',
                  ),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocus);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'A name is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _additAnimal = AnimalOBJ(
                        id: _additAnimal.id,
                        name: value,
                        description: _additAnimal.description,
                        imageUrl: _additAnimal.imageUrl,
                        isAvailableToAdopt: _additAnimal.isAvailableToAdopt,
                        species: _additAnimal.species,
                        gender: _additAnimal.gender,
                        animalStatus: _additAnimal.animalStatus,
                        isFavorite: _additAnimal.isFavorite);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Aniaml Description'),
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  focusNode: _descriptionFocus,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Need to have some details';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _additAnimal = AnimalOBJ(
                      id: _additAnimal.id,
                      name: _additAnimal.name,
                      description: value,
                      imageUrl: _additAnimal.imageUrl,
                      isAvailableToAdopt: _additAnimal.isAvailableToAdopt,
                      species: _additAnimal.species,
                      gender: _additAnimal.gender,
                      animalStatus: _additAnimal.animalStatus,
                      isFavorite: _additAnimal.isFavorite,
                    );
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 160,
                      height: 70,
                      margin: EdgeInsets.only(
                        top: 5,
                        right: 8,
                      ),
                      child: DropdownButtonFormField<AnimalGender>(
                        value: _animalGender,
                        items: [AnimalGender.Female, AnimalGender.Male]
                            .map((label) => DropdownMenuItem(
                                  child: Text(label.toString().split('.').last),
                                  value: label,
                                ))
                            .toList(),
                        hint: Text('Animal Gender'),
                        onChanged: (value) {
                          setState(() {
                            _animalGender = value;
                          });
                        },
                        onSaved: (value) {
                          _additAnimal = AnimalOBJ(
                            id: _additAnimal.id,
                            name: _additAnimal.name,
                            description: _additAnimal.description,
                            imageUrl: _additAnimal.imageUrl,
                            isAvailableToAdopt: _additAnimal.isAvailableToAdopt,
                            species: _additAnimal.species,
                            gender: value,
                            animalStatus: _additAnimal.animalStatus,
                            isFavorite: _additAnimal.isFavorite,
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 70,
                      margin: EdgeInsets.only(
                        top: 5,
                        right: 8,
                      ),
                      child: DropdownButtonFormField<Species>(
                        value: _animalSpecies,
                        items: [Species.Cat, Species.Dog, Species.Other]
                            .map((label) => DropdownMenuItem(
                                  child: Text(label.toString().split('.').last),
                                  value: label,
                                ))
                            .toList(),
                        hint: Text('Animal Species'),
                        onChanged: (value) {
                          setState(() {
                            _animalSpecies = value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Spieces is required';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _additAnimal = AnimalOBJ(
                            id: _additAnimal.id,
                            name: _additAnimal.name,
                            description: _additAnimal.description,
                            imageUrl: _additAnimal.imageUrl,
                            isAvailableToAdopt: _additAnimal.isAvailableToAdopt,
                            species: value,
                            gender: _additAnimal.gender,
                            animalStatus: _additAnimal.animalStatus,
                            isFavorite: _additAnimal.isFavorite,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 160,
                      height: 70,
                      margin: EdgeInsets.only(
                        top: 5,
                        right: 8,
                      ),
                      child: DropdownButtonFormField<AnimalStatus>(
                        value: _animalState,
                        items: [
                          AnimalStatus.Foster_Needed,
                          AnimalStatus.Fostered,
                          AnimalStatus.Homed,
                          AnimalStatus.PickUp
                        ]
                            .map((label) => DropdownMenuItem(
                                  child: Text(label.toString().split('.').last),
                                  value: label,
                                ))
                            .toList(),
                        hint: Text('Animal Avalibility'),
                        onChanged: (value) {
                          setState(() {
                            _animalState = value;
                          });
                        },
                        onSaved: (value) {
                          _additAnimal = AnimalOBJ(
                            id: _additAnimal.id,
                            name: _additAnimal.name,
                            description: _additAnimal.description,
                            imageUrl: _additAnimal.imageUrl,
                            isAvailableToAdopt: _additAnimal.isAvailableToAdopt,
                            species: _additAnimal.species,
                            gender: _additAnimal.gender,
                            animalStatus: value,
                            isFavorite: _additAnimal.isFavorite,
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 70,
                      margin: EdgeInsets.only(
                        top: 5,
                        right: 8,
                      ),
                      child: DropdownButtonFormField<bool>(
                        value: _isAvalibleToAdopt,
                        items: [true, false]
                            .map((label) => DropdownMenuItem(
                                  child: Text(label.toString()),
                                  value: label,
                                ))
                            .toList(),
                        hint: Text('Avalible to Adopt'),
                        onChanged: (value) {
                          setState(
                            () {
                              _isAvalibleToAdopt = value;
                            },
                          );
                        },
                        onSaved: (value) {
                          _additAnimal = AnimalOBJ(
                            id: _additAnimal.id,
                            name: _additAnimal.name,
                            description: _additAnimal.description,
                            imageUrl: _additAnimal.imageUrl,
                            isAvailableToAdopt: value,
                            species: _additAnimal.species,
                            gender: _additAnimal.gender,
                            animalStatus: _additAnimal.animalStatus,
                            isFavorite: _additAnimal.isFavorite,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(
                        top: 5,
                        right: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      child: _imageURLController.text.isEmpty
                          ? Text('Enter a URL')
                          : FittedBox(
                              child: Image.network(_imageURLController.text),
                              fit: BoxFit.cover,
                              clipBehavior: Clip.hardEdge,
                            ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Aniaml Picture URL'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageURLController,
                        onEditingComplete: () {
                          setState(() {});
                        },
                        onSaved: (value) {
                          _additAnimal = AnimalOBJ(
                            id: _additAnimal.id,
                            name: _additAnimal.name,
                            description: _additAnimal.description,
                            imageUrl: value,
                            isAvailableToAdopt: _additAnimal.isAvailableToAdopt,
                            species: _additAnimal.species,
                            gender: _additAnimal.gender,
                            animalStatus: _additAnimal.animalStatus,
                            isFavorite: _additAnimal.isFavorite,
                          );
                        },
                        focusNode: _imageURLFocus,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
