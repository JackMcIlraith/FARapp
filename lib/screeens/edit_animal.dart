import 'package:flutter/material.dart';

class EditAnimalScreen extends StatefulWidget {
  @override
  _EditAnimalScreenState createState() => _EditAnimalScreenState();
}

class _EditAnimalScreenState extends State<EditAnimalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Animal'),
      ),
    );
  }
}
