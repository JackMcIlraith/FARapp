import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/foster.dart';
import '../widgets/foster_item.dart';

class FosterScreen extends StatelessWidget {
  static const routeName = '/foster';
  @override
  Widget build(BuildContext context) {
    final foster = Provider.of<Foster>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your pending foster applications'),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: foster.numberOfApplications,
            itemBuilder: (ctx, i) => FosterItem(
              foster.animals.values.toList()[i].id,
              foster.animals.keys.toList()[i],
              foster.animals.values.toList()[i].name,
              foster.animals.values.toList()[i].imageURL,
              foster.animals.values.toList()[i].fosteringStatus,
            ),
          ),
        )
      ]),
    );
  }
}
