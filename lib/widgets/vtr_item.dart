import 'package:flutter/material.dart';

import '../models/vtr.dart';

// ignore: must_be_immutable
class VTRItem extends StatelessWidget {
  final VTR vtr;

  VTRItem(this.vtr);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          title: Text(vtr.numberOfRecords.toString()),
        ),
      ),
    );
  }
}
